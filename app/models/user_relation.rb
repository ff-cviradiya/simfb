class UserRelation < ActiveRecord::Base
  attr_accessible :receiver_user_id, :request_user_id, :security, :request_status
  belongs_to :user
end
