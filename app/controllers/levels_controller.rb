class LevelsController < ApplicationController
  def index
    @levels = Level.all
  end

  def new; end

  def edit
    @level = Level.find(params[:id])
  end

  def update
    @level = Level.find(params[:id])
    if @level.update(level_params)
      redirect_to levels_path, notice: 'Updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    redirect_to levels_path, notice: 'Deleted!'
  end

  def create
    @level = Level.new(level_params)
    if @level.save
      redirect_to levels_path
    else
      render 'new'
    end
  end

  private

  def level_params
    params.require(:level).permit(:game_level)
  end
end
