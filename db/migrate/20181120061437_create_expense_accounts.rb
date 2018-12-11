# frozen_string_literal: true

class CreateExpenseAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_accounts do |t|
      t.belongs_to :order, index: true
      t.decimal :order_money
      t.integer :expense_id
      t.integer :reviewer_id
      t.string :review_comment
      t.timestamps
    end
  end
end
