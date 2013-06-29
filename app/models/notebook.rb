class Notebook < ActiveRecord::Base
	belongs_to :user
	has_many :notes

	validates :user_id, presence: true
	validates :title, presence: true
end
