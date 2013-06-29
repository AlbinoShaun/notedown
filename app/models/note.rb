class Note < ActiveRecord::Base
	belongs_to :notebook

	validates :notebook_id, presence: true
	validates :title, presence: true
end
