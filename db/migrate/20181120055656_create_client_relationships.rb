class CreateClientRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :client_relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end
