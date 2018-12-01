class Chance < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client
  validates :client, presence: true
  validates :user, presence: true, on: :update
  validates :content, presence: true
end
