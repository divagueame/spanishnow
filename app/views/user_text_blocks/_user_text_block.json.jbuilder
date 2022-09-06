json.extract! user_text_block, :id, :promptTitle, :promptBody, :promptLength, :title, :body, :user_id, :created_at, :updated_at
json.url user_text_block_url(user_text_block, format: :json)
