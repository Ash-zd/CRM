# frozen_string_literal: true

class User < ApplicationRecord
  has_many :client_relationships, dependent: :nullify
  has_many :clients, through: :client_relationships
end
