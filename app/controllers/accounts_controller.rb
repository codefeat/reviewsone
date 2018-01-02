class AccountsController < Devise::RegistraionsController

	def acct_setting
		@user = current_user
		if @user
			render :acct_setting
		else
			render file: 'public/404', status: 404, formats: [:html]
		end
	end
end