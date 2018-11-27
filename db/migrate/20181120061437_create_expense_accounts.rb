class CreateExpenseAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_accounts do |t|
      t.belongs_to :order, index: true
      t.date :review_time
      t.double :order_money
      t.integer :expense_id
      t.intefer :reviewer_id
      t.string :review_comment
      t.timestamps
    end
  end
end
