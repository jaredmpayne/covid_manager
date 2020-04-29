module ApiHelper
  def zip_codes_on_alert
    @zip_codes_on_alert ||= []
  end

  def zip_codes_on_alert=(zip_codes_on_alert)
    @zip_codes_on_alert = zip_codes_on_alert
  end

  def previous_zip_code_counts
    @previous_zip_code_counts ||= {}
  end

  def reset_zip_code_tracking
    @zip_codes_on_alert = []
    @previous_zip_code_counts = {}
  end

  def assign_hospital(patient)
    return if patient.hospital.id != -1
    case patient.patient_status_code
    when "0", "1", "2", "4" then patient.update(hospital: Hospital.find(0))
    else route(patient)
    end
  end

  def route(patient)
    patient_zip = patient.zip_code
    hospitals = (patient.patient_status_code == "6" ? Hospital.where(trauma: "LEVEL IV") : Hospital.all)
    zip_distances = ZipDistance.where(zip_from: patient_zip, zip_to: hospitals.map(&:zip_code)).order(:distance)
    zip_distances.each do |distance|
      hospital = hospitals.find_by(zip_code: distance.zip_to)
      patient.update(hospital: hospital) and return if hospital.bed?
    end
  end
end
