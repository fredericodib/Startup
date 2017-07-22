class Quiz < ApplicationRecord
  belongs_to :school
  has_many :questions, dependent: :destroy
end
