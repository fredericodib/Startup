class Quiz < ApplicationRecord
  belongs_to :school
  has_many :questions, -> { order(:number => :asc) }, dependent: :destroy
end
