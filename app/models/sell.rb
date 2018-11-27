# frozen_string_literal: true

class Sell < ApplicationRecord
  belongs_to :chance, :expense_account
  validates :chance,:expense_account, presence: true
  validates :plan_time,:plan_content, presence: true

end
