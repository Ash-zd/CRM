class AddChanceContextToChance < ActiveRecord::Migration[5.2]
  def change
    add_column :chances, :chance_context, :string
  end
end
