module DoctorsHelper

  def select_doctor
    Doctor.order(:name).map{ |item| [item.name&.titleize, item.id] }
  end

end
