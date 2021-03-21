class GameLevelsController < ApplicationController
  def all_games
    games = GameLevel.select('games.game_name, levels.game_level, priority')
                     .joins(:game, :level)
    render json: { data: games }, status: 200
  end
end
