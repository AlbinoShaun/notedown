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
		end
	end

	describe "when signed in" do
		describe "visiting own page" do
			
		end
	end
end
