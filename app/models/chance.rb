class Chance < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :chance_context,presence: true
end
