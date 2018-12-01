class ExpenseAccount < ApplicationRecord
  belongs_to :order
  validates :order_id, :order_money, :expense_id, presence: true
  validates :review_comment, :reviewer_id, presence: true, on: :update
  validates :order_id, uniqueness: true, numericality: { only_integer: true }
  validates :order_money, numericality: true

end
