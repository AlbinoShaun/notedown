require 'spec_helper'

describe Notebook do
	it { should respond_to :title }
	it { should respond_to :created_at }
	it { should respond_to :updated_at }
	it { should respond_to :user }

	describe "created with no associated user" do
		before do
			@notebook = Notebook.new title: "Lorem Ipsum"
		end

		subject { @notebook }

		it { should_not be_valid }
	end

	describe "belonging to a user" do
		before do
			@user = User.create name: 'Foo Bar', password: 'foobar', password_confirmation: 'foobar'
			@notebook = @user.notebooks.build
		end

		subject { @notebook }

		it { should be_valid }
	end
end
