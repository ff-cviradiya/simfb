class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user


  def print_request_start
    puts "Request started at #{Time.now}"
  end
end
