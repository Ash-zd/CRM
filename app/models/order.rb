class Order < ApplicationRecord
	has_many :order_items
	has_one :expense_accounts
	belongs_to :client
end
