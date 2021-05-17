class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, presence: true, uniqueness: { message: "já existe uma consulta marcada." }
  validates :ends_at, presence: true

  before_validation do
    validate_allowed_times
    self.ends_at = starts_at + duration
  end

  def self.allowed_times
    [
      { starts_at: '09:00:00', ends_at: '09:30:00' },
      { starts_at: '09:30:00', ends_at: '10:00:00' },
      { starts_at: '10:00:00', ends_at: '10:30:00' },
      { starts_at: '10:30:00', ends_at: '11:00:00' },
      { starts_at: '11:00:00', ends_at: '11:30:00' },
      { starts_at: '11:30:00', ends_at: '12:00:00' },
      { starts_at: '13:00:00', ends_at: '13:30:00' },
      { starts_at: '13:30:00', ends_at: '14:00:00' },
      { starts_at: '14:00:00', ends_at: '14:30:00' },
      { starts_at: '14:30:00', ends_at: '15:00:00' },
      { starts_at: '15:00:00', ends_at: '15:30:00' },
      { starts_at: '15:30:00', ends_at: '16:00:00' },
      { starts_at: '16:00:00', ends_at: '16:30:00' },
      { starts_at: '16:30:00', ends_at: '17:00:00' },
      { starts_at: '17:00:00', ends_at: '17:30:00' },
      { starts_at: '17:30:00', ends_at: '18:00:00' }
    ]
  end

  private

    def validate_allowed_times
      starts_at_time = starts_at.strftime("%H:%M:%S")

      if !Appointment.allowed_times.select{ |t| t[:starts_at] == starts_at_time }.present?
        errors.add(:base, "Horário não cadastrado para consultas.")
        throw :abort
      end
    end

    def duration
      30.minutes
    end
  
end
