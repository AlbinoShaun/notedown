json.success @success

if @success
	json.notebook do
		json.(@notebook, :id, :title, :user_id)
		json.created_at @notebook.created_at.iso8601
		json.updated_at @notebook.updated_at.iso8601

		json.notes @notebook.notes do |note|
			json.(note, :id, :title)
			json.created_at note.created_at.iso8601
			json.updated_at note.updated_at.iso8601
		end
	end
else
	json.message @message
end