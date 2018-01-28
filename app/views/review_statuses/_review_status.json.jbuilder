json.extract! review_status, :id, :user_id, :feedback_id, :feedback_status, :note, :created_at, :updated_at
json.url review_status_url(review_status, format: :json)