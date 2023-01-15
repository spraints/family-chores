class GamesController < ApplicationController
  include CreateGame

  def create
    redirect_to(create_game(actor: current_actor))
  end

  def show
    @game = Game.find_by_code(params[:id])
    @me = @game.find_player(current_actor)
  end
end
