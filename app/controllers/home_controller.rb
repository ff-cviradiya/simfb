class HomeController < ApplicationController

  before_filter :print_request_start

  def index
    # QUALITY_BREACH - Unnecessary code.
    10.times do
      2 * 2
    end
    @users = User.fetch_all_users
    @status = Status.new
    @deleteme = 'This is never used'
  end
end
