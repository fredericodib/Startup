class Discipline < ApplicationRecord
	has_many :topics, dependent: :destroy
	has_many :questions, dependent: :destroy


	enum discipline_type: [ :pre_vestibular, :preparatorio_concurcos ]
end
