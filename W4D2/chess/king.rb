require_relative "piece.rb"
class King < Piece
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :K
  end

  def move_diffs
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
      [0,1],
      [0,-1]
      [1,0],
      [-1,0],
    ]
  end

end