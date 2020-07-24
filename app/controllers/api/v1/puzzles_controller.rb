class Api::V1::PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
    render json: @puzzles
  end

  def show
    puzzle = Puzzle.find(params[:id])
    puzzle_array = []
    9.times do |i|
      puzzle_array << puzzle.question.slice(i*9,9).split("").map(&:to_i)
    end
    render json: puzzle_array
  end

  def answer
    puzzle = Puzzle.find(params[:id])
    if params[:data] == puzzle.answer
      render json: true
    else
      render json: false
    end
  end
end
