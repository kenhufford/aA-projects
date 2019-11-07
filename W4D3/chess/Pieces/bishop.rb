require_relative "piece.rb"
require_relative "slideable.rb"
class Bishop < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @symbol = "B"
  end

  def move_dirs
    [:diag]
  end

end