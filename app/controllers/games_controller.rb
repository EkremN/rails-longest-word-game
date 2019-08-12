class GamesController < ApplicationController
  def new
    @letters = (0...8).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    # raise
    @score = params[:answer]
  end
end
