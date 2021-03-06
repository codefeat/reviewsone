class User < ActiveRecord::Base
  #before_create :confirmation_token
#attr_accessor :first_name, :email
after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_user(self).deliver
end

  mount_uploader :image, ImageUploader	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  has_many :invites
  has_many :poor_reviews
  #groupify :group_member
  #groupify :named_group_member
  has_many :profile_reviews

  has_many :profile_links

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :reviews, dependent:  :destroy
         has_many :roles
         has_many :deliveries
         has_many :orders
         has_many :appointments
         has_many :subscriptions
         has_many :plans
         has_many :promos


         validates :business_name, :business_phone, :business_zipcode, :first_name, :last_name, :website_url, presence: true

         # User Avatar Validation
         validates_integrity_of  :image
         validates_processing_of :image

         #validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
         validates :business_zipcode, format: { with: /\A\d{5}(-\d{4})?\z/, message: "should be in the form 12345 or 12345-1234" }
  /\A\(\d{3}\) \d{3}-\d{4}\z/
   def display_name
    	return self.email
    end
 
  private
    def avatar_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

         validates :business_name, :business_phone, :business_zipcode, :first_name, :last_name, :website_url, presence: true
  private
    def set_confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
   
end
