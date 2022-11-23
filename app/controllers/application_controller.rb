class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= get_current_user
  end

  private

  def get_current_user
    get_current_user_from_session ||
      get_current_user_from_remember_me_token ||
      create_current_user
  end

  def get_current_user_from_session
    User.where(id: session[:current_user_id]).first
  end

  def get_current_user_from_remember_me_token
    token = RememberMeToken.where(token: cookies[:remember_me]).first
    token&.user
  end

  def create_current_user
    # todo - don't make a new user every time, just generate an id. when the
    # user does something, then store the user. Or maybe just store the ID.
    user = User.create!
    token = user.remember_me_tokens.create!
    # clear the session?
    session[:current_user_id] = user.id
    cookies.permanent.signed[:remember_me] = token.token
    user
  end
end
