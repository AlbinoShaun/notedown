class Api::V1::NotesController < ApplicationController

	before_action :allow_cors
	skip_before_action :verify_authenticity_token, only: :update

	def show
		@success = true
		begin
			@note = current_user.notes.find(params[:id])
		rescue Exception => e
			@success = false
			@message = "Could not find that note."
		end
	end

	def update
		@success = true
		@saved = true

		begin
			@note = current_user.notes.find(params[:id])
		rescue Exception => e
			@success = false
			@message = "Could not find that note."
			return
		end

		locally_updated_at = Time.parse(params[:locally_updated_at])

		if locally_updated_at > @note.updated_at
			@success = false unless @note.update_attributes(note_params)
		else
			@saved = false
		end

	end

	private

		def note_params
			params.permit(:title, :content)
		end

		def current_user
			@current_user ||= User.find_by(remember_token: params[:session][:remember_token])
		end

end
