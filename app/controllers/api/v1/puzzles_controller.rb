class Api::V1::PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
    question_array = []
    @puzzles.each do |puzzle|
      array = []
      9.times do |i|
        array << puzzle.question.slice(0*i,9).split("").map(&:to_i)
      end
      question_array << array
    end
    render json: {question_array: question_array}
  end

  def show
  end
end
