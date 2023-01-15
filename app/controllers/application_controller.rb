class ApplicationController < ActionController::Base
  # The User or Visitor who is here.
  # Never returns nil.
  def current_actor
    @current_actor ||= get_current_actor
  end

  private

  def get_current_actor
    get_current_user_from_session ||
      get_current_user_from_remember_me_token ||
      get_or_create_visitor
  end

  def get_current_user_from_session
    User.where(id: session[:current_user_id]).first
  end

  def get_current_user_from_remember_me_token
    token = RememberMeToken.where(token: cookies[:remember_me]).first
    token&.user
  end

  def get_or_create_visitor
    visitor = Visitor.new(id: session[:visitor_id].to_s.presence)
    session[:visitor_id] = visitor.id
    # todo: Also a remember me token?
    visitor
  end
end
