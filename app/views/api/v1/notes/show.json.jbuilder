json.success @success

if @success
	json.note do
		json.(@note, :id, :notebook_id, :title, :content)
		json.created_at @note.created_at.iso8601
		json.updated_at @note.updated_at.iso8601
	end
else
	json.message @message
end