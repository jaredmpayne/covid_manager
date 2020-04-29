class ApiController < ApplicationController
  include ApiHelper

  def home
    render 'api/home'
  end

  # GET /api/getteam
  def get_team
    render json: {
      team_name: 'Team Jared',
      team_member_sids: ['10952037'],
      app_status_code: '1'
    }
  end

  # GET /api/reset
  def reset
    Patient.delete_all
    reset_zip_code_tracking
    render json: { reset_status_code: '1' }
  end

  # GET /api/zipalertlist
  def zip_alert_list
    render json: { ziplist: zip_codes_on_alert }
  end

  # GET /api/alertlist
  def alert_list
    render json: { state_status: zip_codes_on_alert.count >= 5 ? '1' : '0' }
  end

  # GET /api/testcount
  def test_count
    negative = Patient.where(patient_status_code: [1, 4]).count.to_s
    positive = Patient.where(patient_status_code: [2, 5, 6]).count.to_s
    render json: { positive_test: positive, negative_test: negative }
  end

  # GET /api/getpatient
  def get_patient
    patient = Patient.find_by(mrn: params[:mrn])
    render json: { mrn: params[:mrn], location_code: patient.location_code }
  end

  # GET /api/gethospital
  def get_hospital
    hospital = Hospital.find(params[:id].to_i)
    render json: {
      total_beds: hospital.total_beds,
      available_beds: hospital.available_beds,
      zip_code: hospital.zip_code
    }
  end

# GET /api/getassignment
  def get_assignment
    patient = Patient.find_by(mrn: params[:mrn])
    assign_hospital(patient) if patient.hospital.id == -1
    render json: { action: patient.action, hospital: patient.hospital.id.to_s }
  end
end
