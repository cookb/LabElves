class Review < ActiveRecord::Base
  attr_accessible :comments, :endorse, :task_id, :title
  
  validates :task_id, :endorse, presence: true
  
  # task
  belongs_to :task, :class_name => "Task", :foreign_key => :task_id
  
  # users? (elf/santa)... meh only if need the association later
end
