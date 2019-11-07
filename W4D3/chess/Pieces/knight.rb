require_relative "piece.rb"
require_relative "steppable.rb"
class Knight < Piece
  include Steppable
  def initialize(color, board, pos)
    super
    @symbol = "N"
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