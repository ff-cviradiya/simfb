class Like < ActiveRecord::Base
  attr_accessible :security, :status_id, :user_id
  has_many :statuses, :dependent => :destroy
  has_many :users, :through => :statuses
end
