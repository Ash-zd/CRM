# frozen_string_literal: true
require 'bcrypt'
class ApplicationController < ActionController::API
  include Doorkeeper::Rails::Helpers
  include Pagy::Backend
  include BCrypt

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
