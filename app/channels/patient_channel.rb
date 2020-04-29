class PatientChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_stream"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def insert_patients(data)
    patients = data["patients"]
    Patient.insert_all(patients.map { |patient|
      patient.merge({ created_at: Time.now, updated_at: Time.now })
    })
  end
end
