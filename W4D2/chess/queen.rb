require_relative "piece.rb"
class Queen < Piece
  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :Q
  end

  def move_dirs
    [:hor, :diag]
  end

end