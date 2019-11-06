require_relative "piece.rb"
class Rook < Piece
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :R
  end

  def move_dirs
    [:hor]
  end

end