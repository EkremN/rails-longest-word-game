require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = (0...8).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @score = params[:answer]
    @score_arr = params[:answer].chars
    @letters = params[:letters].split()
    @valid = @score_arr.all? { |letter| @score_arr.count(letter) <= @letters.count(letter) }

    result = open("https://wagon-dictionary.herokuapp.com/#{params[:answer]}").read
    @english_word = JSON.parse(result)["found"]
    # raise
  end
end

