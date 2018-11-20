class Client < ApplicationRecord
	has_many :client_relationships, dependent: :nullify
	has_many :users, through: :client_relationships


end
