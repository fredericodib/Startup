class Discipline < ApplicationRecord
	has_many :topics, dependent: :destroy
	has_many :questions, dependent: :destroy
	has_many :productivities, dependent: :destroy
	has_many :cronometer_logs, dependent: :destroy


	enum discipline_type: [ :pre_vestibular, :preparatorio_concurcos ]

	default_scope { order(name: :asc) }
end
