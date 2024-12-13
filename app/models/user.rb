class User < ApplicationRecord
  
  belongs_to :profile
  belongs_to :article
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  after_create :create_user_profile

  private
  
    def create_user_profile
      self.create_profile
    end
    
end
