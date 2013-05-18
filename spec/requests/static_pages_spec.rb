require 'spec_helper'

describe "Static Pages" do

	describe "Home Page" do
		before { visit "/" }

		it "should have a login link" do
			page.should have_link "Log in" 
		end

		it "should have a signup link" do
			page.should have_link "Sign up"
		end
	end
end
