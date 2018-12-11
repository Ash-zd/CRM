# frozen_string_literal: true

class UserController < ApplicationController
	before_action :doorkeeper_authorize!

	def create
		user = User.new(params[:username])
		return render json: "password not equals", status: :bad_request if params[:password] != params[:password_confirm]
		user.password = params[:password]
		user.role = "0"
		user.save!
		access_token = Doorkeeper::AccessToken.create(resource_owner_id: user.id, expires_in: expires_in.to_i)
		render json: { access_token: access_token.token, expires_in: access_token['expires_in'] }
	end

	def login
		user = User.find_by(params[:username])
		if user && user.password == params[:password]
			access_token = Doorkeeper::AccessToken.find_or_create_by(nil, user.id, nil, expires_in.to_i, false)
			render json: { access_token: access_token.token, expires_in: access_token['expires_in'] }
		else
			render json: { msg: "authorization failed", code: 401 }, status: :unauthorized
		end
	end

	def logout
		access_token = Doorkeeper::AccessToken.find_by(resource_owner_id: current_user.id)
		access_token.destroy
		render json: { msg: "logout successful" }
	end


	private

	def user_params
		params.permit(:username, :password, :password_confirm)
	end

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def expires_in
		1.day
	end

end
