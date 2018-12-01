class Chance < ApplicationRecord
  belongs_to :user
  belongs_to :client
  validates :user, presence: true, allow_nil: true, on: :update
  validates :context, absence: true
end
