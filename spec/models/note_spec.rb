require 'spec_helper'

describe Note do
	it { should respond_to :title }
	it { should respond_to :content }
	it { should respond_to :created_at }
	it { should respond_to :updated_at }
	it { should respond_to :notebook }

	describe "created with no associated notebook" do
		before { @note = Note.new title: "Lorem Ipsum" }
		specify { @note.should_not be_valid }
	end

	describe "belonging to a notebook" do
		before do
			@user = User.create name: "Foo Bar", password: "foobar", password_confirmation: "foobar"
			@notebook = @user.notebooks.build title: "Lorem Ipsum"
			@notebook.save
			@note = @notebook.notes.build title: "Lorem Ipsum"
		end

		subject { @note }

		it { should be_valid }

		describe "with no title" do
			before { @note.title = '' }
			it { should_not be_valid }
		end
	end
end
