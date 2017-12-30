json.extract! invite, :id, :fname, :lname, :email, :user_group_id, :sender_id, :recipient_id, :token, :created_at, :updated_at
json.url invite_url(invite, format: :json)