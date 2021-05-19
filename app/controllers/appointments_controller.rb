class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.order(:starts_at)
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.starts_at = starts_at_from_params

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, flash: { notice: "Consulta criada com sucesso." } }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      @appointment.starts_at = starts_at_from_params

      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, flash: { notice: "Consulta atualizada com sucesso." } }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    if @appointment.destroy
      message = { notice: "Consulta excluída com sucesso." }
    else
      message = { error: @appointment.errors.full_messages.join(" | ") }
    end

    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, flash: message }
      format.json { head :no_content }
    end
  end

  def get_allowed_times_availables
    array = []

    if params[:date].present?
      date = params[:date].to_date
      allowed_times   = Appointment.allowed_times
      ocuppied_times  = Appointment.where("starts_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day).order(:starts_at)
      ocuppied_times  = ocuppied_times.map { |i| i.starts_at_time_formatted }
      available_times = allowed_times.select { |i| !ocuppied_times.include? i[:starts_at] }
      available_times.each do |i|
        array << {:value => i[:starts_at], :description => i[:starts_at]}
      end
    end

    render :json => array.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:starts_at, :patient_id, :doctor_id)
    end

    def starts_at_from_params
      "#{params[:appointment_date]} #{params[:appointment_time]}".to_datetime
    end
end
