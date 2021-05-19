module PatientsHelper

  def select_patient
    Patient.order(:name).map{ |item| [item.name&.titleize, item.id] }
  end

end
