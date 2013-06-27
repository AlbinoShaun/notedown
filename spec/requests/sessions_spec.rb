require 'spec_helper'

describe "Sessions" do
	before do
		@user = User.create(name: "Foo Bar", password: "foobar", password_confirmation: "foobar")
	end

	subject { page }

	describe "when not signed in" do
		describe "visiting a user's page" do
			before { visit user_path(@user) }

			it { should have_content 'Please sign in' }
	
			describe "signing in" do
				before do
					visit new_session_path
					fill_in 'Name', with: @user.name
					fill_in 'Password', with: @user.password
					click_button 'Sign in'
				end

				it { should have_content 'Sign out' }
				it { should have_content @user.name }
			end
		end
	end

	describe "when signed in" do
		before do
			visit new_session_path
			fill_in 'Name', with: @user.name
			fill_in 'Password', with: @user.password
			click_button 'Sign in'
		end

		describe "visiting own page" do
			before { visit user_path(@user) }
			it { should have_content 'Foo Bar' }
		end
	end
end
