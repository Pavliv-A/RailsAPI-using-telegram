class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def new; end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_name)
  end
end
