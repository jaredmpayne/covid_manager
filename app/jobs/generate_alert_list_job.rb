class GenerateAlertListJob < ApplicationJob
  queue_as :default

  def perform(*args)
    GenerateAlertListJob.set(wait: 15.seconds).perform_later

    on_alert = []
    new_counts = Patient.group(:zip_code).count
    new_counts.each do |zip_code, count|
      old_count = PreviousZipCodeCount.find_by(zip_code: zip_code)
      on_alert << zip_code if old_count && count >= 2 * old_count
    end
    OnAlertZipCode.delete_all
    OnAlertZipCode.insert_all(on_alert.map { |zip_code|
      {
        'zip_code': zip_code,
        'created_at': Time.now,
        'updated_at': Time.now
      }
    })
  end
end
