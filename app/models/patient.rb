class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :birth_date, presence: true
  validates :cpf, presence: true, numericality: { only_integer: true },
    uniqueness: { message: "já cadastrado." }, :cpf => true
    
end
