class UserRelationsController < ApplicationController
  # GET /user_relations
  # GET /user_relations.json
  def index
    @user_relations = UserRelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_relations }
    end
  end

  # GET /user_relations/1
  # GET /user_relations/1.json
  def show
    @user_relation = UserRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_relation }
    end
  end

  # GET /user_relations/new
  # GET /user_relations/new.json
  def new
    @user_relation = UserRelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_relation }
    end
  end

  # GET /user_relations/1/edit
  def edit
    @user_relation = UserRelation.find(params[:id])
  end

  # POST /user_relations
  # POST /user_relations.json
  def create
    @user_relation = UserRelation.new(params[:user_relation])

    respond_to do |format|
      if @user_relation.save
        format.html { redirect_to @user_relation, notice: 'User relation was successfully created.' }
        format.json { render json: @user_relation, status: :created, location: @user_relation }
      else
        format.html { render action: "new" }
        format.json { render json: @user_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_relations/1
  # PUT /user_relations/1.json
  def update
    @user_relation = UserRelation.find(params[:id])

    respond_to do |format|
      if @user_relation.update_attributes(params[:user_relation])
        format.html { redirect_to @user_relation, notice: 'User relation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_relations/1
  # DELETE /user_relations/1.json
  def destroy
    @user_relation = UserRelation.find(params[:id])
    @user_relation.destroy

    respond_to do |format|
      format.html { redirect_to user_relations_url }
      format.json { head :no_content }
    end
  end

  def send_request
    @user_relation_sender = UserRelation.create(:request_status => 'pending', :request_user_id => current_user.id,
                                                :receiver_user_id => params[:user_id], :security => current_user.security)
    @user_relation_reciever = UserRelation.create(:request_status => 'sent', :request_user_id => params[:user_id],
                                                   :receiver_user_id => current_user.id, :security => current_user.security)
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Request sent successfully.' }
      format.json { render json: @user_relation, status: :created, location: @user_relation }
    end
  end

  def pending_requests
    @user_relations = UserRelation.where('receiver_user_id=? AND request_status=?', current_user.id.to_s, 'pending')
  end

  def accept_request
    @user_relations = UserRelation.where('(receiver_user_id=? AND request_user_id=?) OR (receiver_user_id=? AND request_user_id=?)', current_user.id.to_s, params[:id].to_s, params[:id].to_s, current_user.id.to_s)
    @user_relations.each do |ur|
      ur.update_attributes(:request_status=>"accepted")
    end if @user_relations
    respond_to do |format|
      format.html { redirect_to :back, notice: 'You accept the request.' }
      format.json { render json: @user_relation, status: :created, location: @user_relation }
    end
  end

end
