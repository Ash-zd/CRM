class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :introduction
      t.integer :inventory
      t.integer :salesAmount
      t.string :marketingKnowledge

      t.timestamps
    end
  end
end
