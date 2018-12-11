# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :sells
  validates :name, :category, :introduction, :inventory, :sales_amount, :marketing_knowledge, presence: true
  validates :inventory, :sales_amount, numericality: { only_integer: true }
  validates :name, uniqueness: true
end
