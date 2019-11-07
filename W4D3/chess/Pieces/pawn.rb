require_relative "piece.rb"
class Pawn < Piece

  def initialize(color, board, pos)
    super
    @symbol = "P"
  end

  

  def moves
    ret = []
    ret += forward_steps
    ret += side_attacks
    ret.select {|pos| !out_of_range?(pos)}
  end

  private

  def at_start_row?
    if color == "white" && pos[0] == 6
      return true
    elsif color == "black" && pos[0] == 1
      return true
    end
    false
  end

  def forward_dir
    self.color == "white" ? -1 : 1
  end

  def forward_steps
    ret = []
    new_pos = [pos[0]+forward_dir, pos[1]]
    neww_pos = [pos[0]+forward_dir*2, pos[1]]
    ret << new_pos if @board[new_pos] == NullPiece.instance
    if at_start_row?
      ret << neww_pos if @board[neww_pos] == NullPiece.instance
    end
    ret
  end

  def side_attacks
    ret = []
    ret << [pos[0]+forward_dir, pos[1]-1] if @board[[pos[0]+forward_dir,pos[1]-1]] != NullPiece.instance
    ret << [pos[0]+forward_dir, pos[1]+1] if @board[[pos[0]+forward_dir,pos[1]+1]] != NullPiece.instance
    ret
  end




end