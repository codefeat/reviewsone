json.extract! profile_review, :id, :user_id, :address1, :addresss2, :city, :state, :time_zone, :lat, :long, :gplace_id, :gcid, :gfid, :created_at, :updated_at
json.url profile_review_url(profile_review, format: :json)