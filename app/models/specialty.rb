class Specialty < ActiveRecord::Base
  attr_accessible :description, :name, :parent_id, :author_id
  
  validates :author_id, :description, presence: true
  validates :name, presence: true, :uniqueness => true

  # author of spec
  belongs_to :author, :class_name => "User", :foreign_key => :author_id
  
  # specialty nesting
  has_many :children, :class_name => "Specialty", :foreign_key => :parent_id   
  belongs_to :parent, :class_name => "Specialty", :foreign_key => :parent_id   
  
  # join to users
  has_many :spec_joins, :class_name => "SpecJoin", :foreign_key => :spec_id
  has_many :users, :through => :spec_joins
end
