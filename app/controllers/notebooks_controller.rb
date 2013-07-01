class NotebooksController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
		if @notebook.notes.any?
			redirect_to newest_note_path(@notebook)
		else
			redirect_to notebooks_new_note_path(@notebook)
		end
	end

	def new
	end

	def create
		@notebook = current_user.notebooks.build notebook_params
		if @notebook.save
			flash[:success] = 'Notebook created.'
			redirect_to new_notebook_note_path(@notebook)
		else
			flash[:error] = 'Notebook could not be created.'
			redirect_to current_user
		end
	end

	def edit
		redirect_to edit_note_path(@notebook.notes.order(:updated_at).last)
	end

	def update
	end

	def destroy
		@notebook.destroy
		flash[:success] = 'Notebook deleted.'
		redirect_to current_user
	end

	private
		def notebook_params
			params.require(:notebook).permit(:title)
		end

		def correct_user
			@notebook = Notebook.find(params[:id])
			redirect_to @notebook.user unless current_user?(@notebook.user)
		end

		def newest_note_path notebook
			note_path(notebook.notes.order(:updated_at).last)
		end
end
