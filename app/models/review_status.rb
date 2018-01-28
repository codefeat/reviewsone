class ReviewStatus < ActiveRecord::Base
	enum status: [:Attention, :Responded, :Resolved]

end
