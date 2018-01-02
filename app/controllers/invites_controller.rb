class InvitesController < InheritedResources::Base
  before_action :authenticate_user!

  #after_action :get_invite_index

    def index
    	@user = current_user
    	@invites = Invite.all
    end

	def new
    	@invite = Invite.new
    end

	def create
	  @invite = Invite.new(invite_params)

	  respond_to do |format|
	    if @invite.save
	      format.html { redirect_to invites_path, notice: 'invite was successfully created.' }
	    else
	      format.html { render action: "new" }
	    end
	  end
	end

  private

    def invite_params
      params.require(:invite).permit(:fname, :lname, :email, :user_group_id, :sender_id, :recipient_id, :token)
    end


	#def new
		#@invite = Invite.new
	#end

	#def edit
		#@invite = Invite.find(params[:id])
	#end
end

