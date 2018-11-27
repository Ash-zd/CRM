# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :introduction
      t.integer :inventory
      t.integer :sales_amount
      t.string :marketing_knowledge

      t.timestamps
    end
  end
end
