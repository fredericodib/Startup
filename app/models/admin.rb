class Admin < ApplicationRecord
  belongs_to :school, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   enum role: [ :manager, :school_manager, :coordinator, :teacher ]

   validates :name, :cpf, :phone, presence: true
   validates :cpf, uniqueness: true
end
