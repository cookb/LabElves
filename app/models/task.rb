class Task < ActiveRecord::Base
  attr_accessible :status, :user_id, :elf_id, :spec_id, :subject, :body, 
  :duration, :location, :lat_long, :credits, :time_start, :time_end, :time_final
  
  validates :status, :user_id, :spec_id, :subject, :body, :duration, :location, 
    :credits, :time_start, :time_end, presence: true
    
  # review
  has_one :review, :class_name => "Review", :foreign_key => :task_id  
  
  # bids
  has_many :bids, :class_name => "Bid", :foreign_key => :task_id  
  
  # specialty
  belongs_to :specialty, :class_name => "Specialty", :foreign_key => :spec_id
  
  # santa
  belongs_to :santa, :class_name => "User", :foreign_key => :user_id
  
  # elf
  belongs_to :elf, :class_name => "User", :foreign_key => :elf_id
end
