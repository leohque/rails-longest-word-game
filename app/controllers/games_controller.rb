# frozen_string_literal: true

require 'open-uri'
require 'json'

# GamesController
class GamesController < ApplicationController
  cookies = Rails.application.config.session_store :cookie_store
  cookies[:score] = 0

  LETTERS = ('A'..'Z').to_a

  def new
    @letters = LETTERS.sample(10)
  end

  def score
    @word_in_grid = word_in_grid?(params[:word], params[:letters])
    @word_is_real = word_real?(params[:word])

    word_score = params[:word].length * 17
    cookies[:score] = cookies[:score].to_i
    cookies[:score] += word_score if @word_in_grid && @word_is_real
  end

  def word_in_grid?(word, letters)
    game_letters = letters.split(' ')
    word_letters = word.upcase.split('')
    correct_letters = []

    word_letters.each do |letter|
      if game_letters.include? letter
        game_letters.delete(letter)
        correct_letters.push(letter)
      end
    end

    correct_letters.join == word_letters.join
  end

  def word_real?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url).read
    json = JSON.parse(response)
    json['found']
  end
end
