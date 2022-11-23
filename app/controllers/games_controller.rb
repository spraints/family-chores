class GamesController < ApplicationController
  def new
    redirect_to game_path("NEWGM1")
  end

  def show
    @id = params[:id]
  end
end
