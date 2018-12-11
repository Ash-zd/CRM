# frozen_string_literal: true

class Sell < ApplicationRecord
  belongs_to :product
  validates :product_num, :sale_path, :price, :plan_time, :sale_expense, presence: true
  validates :product_num, :product_id, numericality: { only_integer: true }
  validates :price, :sale_expense, numericality: true
end
