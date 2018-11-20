# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :nullify
  belongs_to :client
end
