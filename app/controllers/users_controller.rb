class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]

	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = 'Account created! Welcome to Notedown'
			sign_in @user
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end
end
