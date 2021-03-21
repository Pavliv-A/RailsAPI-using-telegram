class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new; end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to games_path, notice: 'Updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: 'Deleted!'
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_name)
  end
end
