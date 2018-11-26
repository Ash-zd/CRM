class Product < ApplicationRecord
  validates :name, :category, :introduction, :inventory, :salesAmount, :marketingKnowledge, presence: true
  validates :name, uniqueness: true
end
