require_relative "piece.rb"
require_relative "slideable.rb"
class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @symbol = "Q"
  end

  def move_dirs
    [:hor, :diag]
  end

end