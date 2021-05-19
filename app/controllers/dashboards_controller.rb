class DashboardsController < ApplicationController
  def index
    #@patients_attended_count = @appointments_realized.pluck(:patient_id).uniq.count
  end

  def get_appointments_realized_by_doctor
    appointments = appointments_realized params[:doctor_id]

    render json: appointments.to_json
  end

  def get_patients_attended_count_by_doctor
    appointments = appointments_realized params[:doctor_id]
    patients_attended_count = appointments.pluck(:patient_id).uniq.count

    render json: patients_attended_count.to_json
  end

  private

    def appointments_realized doctor_id=nil
      if doctor_id.present?
        appointments_realized = Appointment.where('doctor_id = ? and ends_at <= ?', doctor_id, Time.new)
      else
        appointments_realized = Appointment.where('ends_at <= ?', Time.new)
      end
    end
end
