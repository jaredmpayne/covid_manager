class Patient < ApplicationRecord
  belongs_to :hospital

  def location_code
    self.hospital.id
  end

  def action
    case self.patient_status_code
    when "0", "2", "4" then "Stay at home until condition changes."
    when "1" then "Stay at home and practice distancing."
    when "3" then "Report to the closest available facility for testing."
    when "5" then "Report to the closest available facility for treatment."
    when "6" then "Report to the closest available Level IV of better treatment facility."
    end
  end
end
