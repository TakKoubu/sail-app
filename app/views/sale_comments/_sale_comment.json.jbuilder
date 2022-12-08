json.extract! sale_comment, :id, :content, :sale_id, :created_at, :updated_at
json.url sale_comment_url(sale_comment, format: :json)
