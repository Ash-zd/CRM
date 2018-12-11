# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :client_relationships, dependent: :nullify
  has_many :clients, through: :client_relationships
  has_many :chance, dependent: :nullify

  validates :username, uniqueness: true

end
