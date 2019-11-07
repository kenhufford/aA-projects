require_relative "piece.rb"
require_relative "slideable.rb"
class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @symbol = "R"
  end

  def move_dirs
    [:hor]
  end

end