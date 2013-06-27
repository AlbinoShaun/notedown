require 'spec_helper'

describe "Users" do

	describe "signup" do
		before { visit new_user_path }
		it "should have a name field" do
			page.should have_field 'Name'
		end

		it "should have a password field" do
			page.should have_field 'Password'
		end

		it "should have a password confirmation field" do
			page.should have_field 'Confirm Password'
		end

		describe "creating a new user" do
			before do
				fill_in 'Name', with: 'Foo Bar'
				fill_in 'Password', with: 'foobar'
				fill_in 'Confirm Password', with: 'foobar'
				click_button 'Create account'
			end

			it "should show a successful flash message" do
				page.should have_content "Account created"
			end

			it "should redirect the user to their profile page" do
				page.should have_content "Foo Bar"
			end

			it "should sign the user in" do
				page.should have_content "Sign out"
			end
		end
	end

	describe "editing own user account" do
		subject { page }

		before do
			@user = User.create name: 'Foo Bar', password: 'foobar', password_confirmation: 'foobar'
			visit new_session_path
			fill_in 'Name', with: @user.name
			fill_in 'Password', with: @user.password
			click_button 'Sign in'

			visit edit_user_path(@user)
		end

		it { should have_field 'Name' }
		it { should have_field 'Password' }
		it { should have_button 'Save' }

		describe 'updating details' do
			before do
				fill_in 'Name', with: 'Lorem Ipsum'
				fill_in 'Password', with: 'loremipsum'
				fill_in 'Confirm Password', with: 'loremipsum'
				click_button 'Save'
			end

			it { should have_selector '.alert-success' }
		end
	end

	describe "deleting own user account" do
		before do
			@user = User.create name: 'Foo Bar', password: 'foobar', password_confirmation: 'foobar'
			visit new_session_path
			fill_in 'Name', with: @user.name
			fill_in 'Password', with: @user.password
			click_button 'Sign in'
			visit edit_user_path(@user)
		end

		it "should have a link to delete the user's account" do
			page.should have_link 'Delete account'
		end

		it "should delete the account" do
			expect { click_link 'Delete account' }.to change(User, :count).by(-1)
		end

		it "should sign the user out" do
			click_link 'Delete account'
			page.should have_link 'Sign in'
		end
	end
end
