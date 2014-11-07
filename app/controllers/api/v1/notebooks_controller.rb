class Api::V1::NotebooksController < ApplicationController

	def index
		render json: current_user.notebooks
	end

	def show
		render json: current_user.notebooks.find(params[:id]).to_json(include: :notes)
	end

	private
		def current_user
			@current_user ||= User.find_by(remember_token: params[:session][:remember_token])
		end 

end
