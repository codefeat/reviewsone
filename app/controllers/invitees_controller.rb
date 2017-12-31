class InviteesController < InheritedResources::Base

  private

    def invitee_params
      params.require(:invitee).permit(:fname, :lname, :email, :sent_by_id)
    end

    def new
    	@invitee = Invitee.new
    end
end

