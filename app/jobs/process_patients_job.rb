class ProcessPatientsJob < ApplicationJob
  include ApiHelper

  queue_as :default

  def perform(mrns)
    patients = Patient.where(mrn: mrns)
    patients.each { |patient| assign_hospital(patient) }
  end
end
