class Api::V1::SessionsController < ApplicationController

	before_action :allow_cors
	skip_before_action :verify_authenticity_token

	def create
		user = User.find_by(name: params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			render json: { success: true, session: { remember_token: user.remember_token } }
		else
			render json: { success: false, message: 'Incorrect username or password' }
		end
	end

end
