class Doctor < ApplicationRecord  
  has_many :appointments, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :crm, presence: true, length: { maximum: 20 }, uniqueness: { scope: :crm_uf, case_sensitive: false,
  message: "já cadastrado nesta UF." }
  validates :crm_uf, presence: true, length: { is: 2 }
  
  before_validation do
    crm_uf.upcase!
  end  

  before_destroy :check_for_appointments, prepend: true

  private

    def check_for_appointments
      if appointments.any?
        errors.add(:base, "O Médico possui consultas.")
        throw :abort
      end
    end
    
end
