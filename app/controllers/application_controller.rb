class ApplicationController < ActionController::Base
  # The User or Visitor who is here.
  # Never returns nil.
  def current_user_or_visitor
    @current_user_or_visitor ||= get_current_user_or_visitor
  end

  private

  def get_current_user_or_visitor
    get_current_user_from_session ||
      get_current_user_from_remember_me_token ||
      get_visitor
  end

  def get_current_user_from_session
    User.where(id: session[:current_user_id]).first
  end

  def get_current_user_from_remember_me_token
    token = RememberMeToken.where(token: cookies[:remember_me]).first
    token&.user
  end

  def get_visitor_from_session
    visitor = Visitor.new(id: session[:visitor_id].to_s.presence)
    session[:visitor_id] = visitor.id
    # todo: Also a remember me token?
    visitor
  end
end
