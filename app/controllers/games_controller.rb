class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end


  def score
    @letters = params[:letters].split
    @word = params[:word]
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)

  end
end



private

def english_word?(word)
  response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
end




