class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_url(@game), notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def start
    @game = Game.find(params[:game_id])
    @game.start
    redirect_to game_url(@game), notice: "Game was successfully started."
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name)
  end
end
