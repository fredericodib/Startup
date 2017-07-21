class School < ApplicationRecord
	has_many :admins, dependent: :destroy
	has_many :students, dependent: :destroy
	mount_uploader :photo, PhotoUploader

	validates :name, :cnpj, :cep, :address, :social_reason, presence: true
	validates :cnpj, uniqueness: true
end
