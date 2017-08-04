class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :discipline
  has_many :choices, dependent: :destroy
  has_and_belongs_to_many :topics

  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
end
