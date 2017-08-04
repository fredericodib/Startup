class Discipline < ApplicationRecord
	has_many :topics, dependent: :destroy
	has_many :questions, dependent: :destroy
end
