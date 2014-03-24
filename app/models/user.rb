class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  
  validates :first_name, :last_name, :presence => true
  
  has_many :authentications
       
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid).first
    user = User.find_by_email(auth.info.email)
    if user
      if authentication.present?
        authentication.update_attributes(:provider=>auth.provider,:uid=> auth.uid,  :user_id => user.id)
      else
        authentication= Authentication.create(:provider=>auth.provider,:uid=> auth.uid, :user_id => user.id)
      end
    end
    unless authentication
      user = User.new(first_name:auth.extra.raw_info.first_name,
        last_name:auth.extra.raw_info.last_name,
        email:auth.info.email,
        password:Devise.friendly_token[0,20],
        confirmation_token: nil,
        confirmed_at:Time.now
      )
      unless user.save
        return nil
      else
        authentication= Authentication.create(:provider=>auth.provider,:uid=> auth.uid, :user_id => user.id)
      end
    end
    authentication.save
    authentication.user
  end
  
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    authentication = Authentication.where(:provider => access_token.provider, :uid => access_token.uid).first
    data = access_token.info
    user = User.find_by_email(data["email"])
    if user
      if authentication.present?
        authentication.update_attributes(:provider=>access_token.provider,:uid=> access_token.uid,  :user_id => user.id)
      else
        authentication= Authentication.create(:provider=>access_token.provider,:uid=> access_token.uid, :user_id => user.id)
      end
    end
    unless authentication
      user = User.new(first_name:data["first_name"],
        last_name:data["last_name"],
        email:data["email"],
        password:Devise.friendly_token[0,20],
        confirmation_token: nil,
        confirmed_at:Time.now
      )
      unless user.save
        return nil
      else
        authentication= Authentication.create(:provider=>access_token.provider,:uid=> access_token.uid,  :user_id => user.id)
      end
    end
    authentication.save
    authentication.user
  end
end
