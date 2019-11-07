require "singleton"
require_relative "piece.rb"

class NullPiece < Piece
  include Singleton
  def initialize
    @color = nil
    @symbol = " "
  end

  def moves
    []
  end

  def move_into_check?(end_pos)
    ""
  end

  def valid_moves
    []
  end

  
end