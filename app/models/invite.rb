class Invite < ActiveRecord::Base
	after_create :send_invite

	#belongs_to :user_group

	#belongs_to :sender, :class_name => 'User'

	#belongs_to :recipient, :class_name => 'User'

	def send_invite
		MyMailer.new_invite(self).deliver_now
	end
end