class CronometerLog < ApplicationRecord
  belongs_to :discipline
  belongs_to :student

  validates :time, :date, presence: true
end
