json.extract! poor_review, :id, :user_id, :invite_id, :first_name, :last_name, :message, :created_at, :updated_at
json.url poor_review_url(poor_review, format: :json)