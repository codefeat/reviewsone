json.extract! invitee, :id, :fname, :lname, :email, :sent_by_id, :created_at, :updated_at
json.url invitee_url(invitee, format: :json)