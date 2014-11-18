class Api::V1::NotesController < ApplicationController

	def show
		@success = true
		begin
			@note = current_user.notes.find(params[:id])
		rescue Exception => e
			@success = false
			@message = "Could not find that note."
		end
	end

	private
		def current_user
			@current_user ||= User.find_by(remember_token: params[:session][:remember_token])
		end

end
