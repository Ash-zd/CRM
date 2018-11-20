class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.datetime :birthday
      t.string :address


      t.timestamps
    end
  end
end