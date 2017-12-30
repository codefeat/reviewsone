class InvitesController < InheritedResources::Base

  private

    def invite_params
      params.require(:invite).permit(:fname, :lname, :email, :user_group_id, :sender_id, :recipient_id, :token)
    end
end

