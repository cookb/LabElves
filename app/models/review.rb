class Review < ActiveRecord::Base
  attr_accessible :comments, :endorse, :task_id, :title
  
  validates :task_id, presence: true, uniqueness: true
  
  # task
  belongs_to :task, :class_name => "Task", :foreign_key => :task_id
  
  # elf
  has_one :elf, :through => :task
  
  # santa
  has_one :santa, :through => :task
end
