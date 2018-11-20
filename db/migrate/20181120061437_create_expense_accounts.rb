# frozen_string_literal: true

class CreateExpenseAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_accounts do |t|
      t.string :details
      t.timestamps
    end
  end
end
