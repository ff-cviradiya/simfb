module UsersHelper
  def friends_count
    @user_relations = UserRelation.where("receiver_user_id=? AND request_status=?", current_user.id.to_s, "accepted")
    return @user_relations.length
  end
end

