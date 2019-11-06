require_relative "piece.rb"
class Knight < Piece
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :N
  end

  def move_diffs
    [
      [1,2],
      [1,-2],
      [-1,2],
      [-1,-2],
      [2,1],
      [2,-1],
      [-2,1],
      [-2,-1]
    ]
  end

end