module AppointmentsHelper

  def starts_and_end_time appointment
    "#{time_short_br appointment.starts_at} às #{time_short_br appointment.ends_at}"
  end

end
