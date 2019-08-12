require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end


  def is_english?(word)
    url = open("https://wagon-dictionary.herokuapp.com/#{word}").read
    @parsed_url = JSON.parse(url)
    @parsed_url['found']
  end


  def grid_check(attempt, grid)
    attempt.upcase.chars.each do |letter|
      # byebug
      if grid.include?(letter)
        grid.delete_at(grid.index(letter))
      else
        false
        break
      end
    end
  end

  def score
    word = params[:word].upcase
    grid = params[:grid].split(" ")
    if word.nil?
      @answer = " no words where given"
    elsif grid_check(word, grid).nil?
      @answer = "Sorry but #{word.upcase} can't be made out of #{grid}"
    elsif is_english?(word) == false
      @answer = "the word #{word.upcase} is not an english word"
    else
      @answer = " Congratulation #{word} is a valid english word "
    end
  end
end

private

def letters
  Array.new(10) { ('A'..'Z').to_a.sample }
end


# if @parsed_url[:found] == false
#       @answer = "Sorry but #{word} is not an english word"
#     else
#       @answer = well done
#   end
