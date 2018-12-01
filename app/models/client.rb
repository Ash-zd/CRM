class Client < ApplicationRecord
	has_many :client_relationships, dependent: :nullify
	has_many :users, through: :client_relationships
	has_many :chances


end
