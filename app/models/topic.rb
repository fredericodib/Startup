class Topic < ApplicationRecord
  belongs_to :discipline
  has_and_belongs_to_many :questions
end
