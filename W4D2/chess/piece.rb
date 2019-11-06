
class Piece
  # attr_accessor :pos
  attr_reader :color, :pos
  attr_writer :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @symbol = ""
  end

  def to_s
    p @symbol
  end

  def empty?
    return true if self == NullPiece.instance
    false
  end

  def move_into_check?(end_pos)

  end

  def valid_moves
    []
  end

  
end