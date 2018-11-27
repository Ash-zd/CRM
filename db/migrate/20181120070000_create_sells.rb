# frozen_string_literal: true

class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.belongs_to :product ,index: true
      t.integer :product_num
      t.string :sale_path
      t.double :price
      t.date :plan_time
      t.double :sale_expense
      t.timestamps
    end
  end
end
