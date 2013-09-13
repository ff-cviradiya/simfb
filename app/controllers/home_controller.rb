class HomeController < ApplicationController
  def index
    # This code is to understand if code quality metric catches it
    10.times do
      2 * 2
    end
    @users = User.all
    @status = Status.new

  end
end
