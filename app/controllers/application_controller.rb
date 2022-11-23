class ApplicationController < ActionController::Base
  helper_method :logged_in?
  def logged_in?
    rand > 0.5
  end
end
