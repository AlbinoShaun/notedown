json.success @success

if @success
	json.note do
		json.(@note, :id, :notebook_id, :title, :content, :created_at, :updated_at)
	end
else
	json.message @message
end