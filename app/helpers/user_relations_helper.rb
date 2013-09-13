module UserRelationsHelper

  def pending_request_count
    @user_relations = UserRelation.where('receiver_user_id=? AND request_status=?', current_user.id.to_s, 'pending')
    return @user_relations.length
  end
end
