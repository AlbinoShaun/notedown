json.success @success

json.notebooks @notebooks do |notebook|
	json.(notebook, :id, :title, :user_id)
	json.created_at notebook.created_at.iso8601
	json.updated_at notebook.updated_at.iso8601
end