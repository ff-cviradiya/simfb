require 'test_helper'

class UserRelationsControllerTest < ActionController::TestCase
  setup do
    @user_relation = user_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_relation" do
    assert_difference('UserRelation.count') do
      post :create, user_relation: { receiver_user_id: @user_relation.receiver_user_id, request_user_id: @user_relation.request_user_id, security: @user_relation.security }
    end

    assert_redirected_to user_relation_path(assigns(:user_relation))
  end

  test "should show user_relation" do
    get :show, id: @user_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_relation
    assert_response :success
  end

  test "should update user_relation" do
    put :update, id: @user_relation, user_relation: { receiver_user_id: @user_relation.receiver_user_id, request_user_id: @user_relation.request_user_id, security: @user_relation.security }
    assert_redirected_to user_relation_path(assigns(:user_relation))
  end

  test "should destroy user_relation" do
    assert_difference('UserRelation.count', -1) do
      delete :destroy, id: @user_relation
    end

    assert_redirected_to user_relations_path
  end
end
