class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :confirmable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :location, :education, :institution, :link

  validates :name, :education, :location, presence: true
end
