class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.date :plan_time
      t.text :plan_content
      t.belongs_to :chance
      t.belongs_to :expense_account
      t.timestamps
    end
  end
end
