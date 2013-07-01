class NotesController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@note = current_user.notebooks.find(params[:notebook_id]).notes.build
	end

	def create
		@note = current_user.notebooks.find(params[:notebook_id]).notes.build(note_params)
		if @note.save
			flash[:success] = 'Note created.'
			redirect_to edit_note_url(@note)
		else
			flash.now[:error] = "Note could not be saved."
			render 'new'
		end
	end

	def edit
	end

	def update
		if @note.update_attributes(note_params)
			flash.now[:success] = 'Note saved.'
		else
			flash.now[:error] = 'Note could not be saved.'
		end
		render 'edit'
	end

	def destroy
		notebook = @note.notebook
		@note.destroy
		flash[:success] = 'Note deleted.'
		redirect_to notebook
	end

	private
		def note_params
			params.require(:note).permit(:title, :content)
		end

		def correct_user
			@note = Note.find(params[:id])
			redirect_to @note.notebook.user unless current_user?(@note.notebook.user)
		end
end
