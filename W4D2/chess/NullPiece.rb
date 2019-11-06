require "singleton"
require_relative "piece.rb"

class NullPiece < Piece
  include Singleton
  def initialize(color, board, pos)
    @color = nil
    @board = board
    @pos = pos
    @symbol = " "
  end

  def to_s
    p @symbol
  end


  def move_into_check?(end_pos)
    ""
  end

  def valid_moves
    []
  end

  
end