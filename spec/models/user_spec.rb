require 'spec_helper'

describe User do
	before do 
		@user = User.new(name: "Foo Bar", password: "foobar", password_confirmation: "foobar")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "with blank password confirmation" do
		before do
			@user = User.new(name: "Foo Bar", password: "foobar", password_confirmation: " ")
		end

		it { should_not be_valid }
	end

	describe "with password not matching confirmation" do
		before { @user.password_confirmation = "barbaz" }
		it { should_not be_valid }
	end

	describe "with blank user name" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "with short password" do
		before { @user.password = @user.password_confirmation = "short" }
		it { should_not be_valid }
	end
end
