class Notebook < ActiveRecord::Base
	belongs_to :user
	has_many :notes, dependent: :destroy

	validates :user_id, presence: true
	validates :title, presence: true
end
