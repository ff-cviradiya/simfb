class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def search_friend
    @user_list = User.find_by_sql("select * from users where first_name like '%#{params[:key_word]}%'
OR last_name like '%#{params[:key_word]}%' OR username like '%#{params[:key_word]}%' OR city like '%#{params[:key_word]}%'")
    render :partial=>"home/user_list"
  end

  def friends_list
    @friends = []
    @user_relations = UserRelation.where("receiver_user_id=? AND request_status=?", current_user.id.to_s, "accepted")
    @user_relations.each do |ur|
      @friends << User.where("id=?", ur.request_user_id.to_s)
    end if @user_relations
    @friends = @friends.flatten
  end

end
