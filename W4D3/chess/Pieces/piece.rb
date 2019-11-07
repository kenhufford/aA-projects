
class Piece
  # attr_accessor :pos
  attr_reader :color, :pos, :symbol
  attr_writer :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @symbol = ""
  end

  def to_s
    @symbol
  end

  def empty?
    return true if self == NullPiece.instance
    false
  end

  def move_into_check?(end_pos)
    false
  end


  def valid_moves
    ret = []

    moves.each do |move|
      if !move_into_check?(move) && @board[move].color != self.color
        ret << move
      end
    end

    ret
  end

  protected
  def out_of_range?(pos)
    return true if pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
    false
  end

  
end