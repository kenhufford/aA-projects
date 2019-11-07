require_relative "piece.rb"
require_relative "steppable.rb"
class King < Piece
  include Steppable
  def initialize(color, board, pos)
    super
    @symbol = "K"
  end

  def move_diffs
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
      [0,1],
      [0,-1],
      [1,0],
      [-1,0],
    ]
  end

end