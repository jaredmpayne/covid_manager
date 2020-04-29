class GenerateAlertListJob < ApplicationJob
  include ApiHelper

  queue_as :default

  def perform(*args)
    GenerateAlertListJob.set(wait: 15.seconds).perform_later

    on_alert = []
    new_counts = Patient.group(:zip_code).count
    new_counts.each do |zip_code, count|
      old_count = previous_zip_code_counts[zip_code]
      on_alert << zip_code if old_count && count >= 2 * old_count
    end
    zip_codes_on_alert = on_alert
  end
end
