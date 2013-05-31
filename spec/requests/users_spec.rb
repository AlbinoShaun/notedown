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
end
