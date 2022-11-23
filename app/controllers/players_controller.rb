class PlayersController < ApplicationController
  def create
    session[:player_name] = params[:player_name] || "you are a guest"
    redirect_to game_path(id: params[:game_id] || "EXGM12")
  end
end
