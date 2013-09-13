class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  # :confirmable, 
  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, 
    :location, :education, :institution, :link, :latitude, :longitude, :credits
  
  validates :name, :education, :location, presence: true
  
  # specs authored
  has_many :authored_specs, :class_name => "Specialty", :foreign_key => :author_id    

  # specialties
  has_many :spec_joins, :class_name => "SpecJoin", :foreign_key => :user_id
  has_many :specialties, :through => :spec_joins
  
  # bids
  has_many :bids, :class_name => "Bid", :foreign_key => :elf_id
  
  # tasks
  has_many :santa_tasks, :class_name => "Task", :foreign_key => :user_id
  has_many :elf_tasks, :class_name => "Task", :foreign_key => :elf_id    
  
  # reviews
  has_many :reviews_received, :through => :elf_tasks, :source => :review
  has_many :reviews_authored, :through => :santa_tasks, :source => :review

end
