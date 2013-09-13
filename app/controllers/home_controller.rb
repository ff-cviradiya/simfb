class HomeController < ApplicationController
  def index
    @users = User.all
    @status = Status.new
  end
end
