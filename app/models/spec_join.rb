class SpecJoin < ActiveRecord::Base
  attr_accessible :spec_id, :user_id
  validates :spec_id, :user_id, presence: true
  validates_uniqueness_of :user_id, :scope => :spec_id
  
  # connect join table
  belongs_to :user, :class_name => "User", :foreign_key => :user_id
  belongs_to :specialty, :class_name => "Specialty", :foreign_key => :spec_id
end
