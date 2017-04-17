json.extract! comment, :id, :body, :references, :created_at, :updated_at
json.url comment_url(comment, format: :json)