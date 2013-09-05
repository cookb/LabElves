class Bid < ActiveRecord::Base
  attr_accessible :credits_bid, :elf_id, :task_id, :time_bid
  
  validates :credits_bid, :elf_id, :task_id, :time_bid, presence: true
  validates_uniqueness_of :elf_id, :scope => :task_id
  
  # task
  belongs_to :task, :class_name => "Task", :foreign_key => :task_id
  
  # elf
  belongs_to :elf, :class_name => "User", :foreign_key => :elf_id  
  
end
