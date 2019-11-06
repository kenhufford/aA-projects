require_relative "piece.rb"
class Bishop < Piece
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :B
  end

  def move_dirs
    [:diag]
  end

end