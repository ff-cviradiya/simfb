class HomeController < ApplicationController
  def index
    # QUALITY_BREACH - Unnecessary code.
    10.times do
      2 * 2
    end
    @users = User.fetch_all_users
    @status = Status.new

  end
end
