class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  respond_to :html, :json

  protect_from_forgery with: :exception

  #protect_from_forgery 


  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:zipcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:promo_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:zipcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:packs_num]) 
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email]) 
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name]) 
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:last_name]) 
  end

  def create_subscription
      Subscription.create(:user_id => current_user.id, :plan_id => 1)
  end

  #def respond_modal_with(*args, &blk)
    #options = args.extract_options!
    #options[:responder] = ModalResponder
    #respond_with *args, options, &blk
  #end

  def get_invite_index
    format.html { redirect_to invites_url, notice: 'Invite status was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
  end


end
