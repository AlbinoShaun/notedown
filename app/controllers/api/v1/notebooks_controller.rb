class Api::V1::NotebooksController < ApplicationController

	def index
		@success = true
		@notebooks = current_user.notebooks
	end

	def show
		@success = true
		@notebook = current_user.notebooks.find(params[:id])
	end

	private
		def current_user
			@current_user ||= User.find_by(remember_token: params[:session][:remember_token])
		end

end
