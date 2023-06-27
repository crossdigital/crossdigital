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

  def edit
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_url(@game), notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @game.update(game_params)
      redirect_to game_url(@game), notice: "Game was successfully updated."
      render :show, status: :ok, location: @game
    else
      render :edit, status: :unprocessable_entity
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy

    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :state, :winning_team)
  end
end
