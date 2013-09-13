class Status < ActiveRecord::Base
  attr_accessible :description, :security, :user_id
  belongs_to :like
  belongs_to :user
  
  validates_presence_of :description
end
