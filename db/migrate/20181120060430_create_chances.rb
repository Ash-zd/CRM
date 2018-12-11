# frozen_string_literal: true

class CreateChances < ActiveRecord::Migration[5.2]
  def change
    create_table :chances do |t|
      t.belongs_to :client, index: true
      t.string :content
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
