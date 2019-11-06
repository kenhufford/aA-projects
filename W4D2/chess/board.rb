require_relative "piece.rb"

class Board

  def initialize
    # nullpiece = NullPiece.instance
    nullpiece = nil
    @rows = Array.new(8) {Array.new(8, nullpiece)}

    self[[7,3]] = w_king = Piece.new("white",self, [7,3])
    self[[7,4]] = w_queen = Piece.new("white",self, [7,4])
    self[[7,1]] = w_knight1 = Piece.new("white",self, [7,1])
    self[[7,6]] = w_knight2 = Piece.new("white",self, [7,6])
    self[[7,2]] = w_bishop1 = Piece.new("white",self, [7,2])
    self[[7,5]] = w_bishop2 = Piece.new("white",self, [7,5])
    self[[7,0]] = w_rook1 = Piece.new("white",self, [7,0])
    self[[7,7]] = w_rook2 = Piece.new("white",self, [7,7])

    self[[0,3]] = b_king = Piece.new("black",self, [0,3])
    self[[0,4]] = b_queen = Piece.new("black",self, [0,4])
    self[[0,1]] = b_knight1 = Piece.new("black",self, [0,1])
    self[[0,6]] = b_knight2 = Piece.new("black",self, [0,6])
    self[[0,2]] = b_bishop1 = Piece.new("black",self, [0,2])
    self[[0,5]] = b_bishop2 = Piece.new("black",self, [0,5])
    self[[0,0]] = b_rook1 = Piece.new("black",self, [0,0])
    self[[0,7]] = b_rook2 = Piece.new("black",self, [0,7])

    (0...8).each do |i|
      w_pawn = Piece.new("white",self, [6,i])
      self[[6,i]] = w_pawn
      b_pawn = Piece.new("black",self, [1,i])
      self[[1,i]] = b_pawn
    end
    
  end



  def [](pos)
    row, col = pos[0], pos[1]
    @rows[row][col]
  end
  
  def []=(pos, value)
    row, col = pos[0], pos[1]
    @rows[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] != nil && self[end_pos] == nil
      self[start_pos].pos = end_pos
      self[start_pos], self[end_pos] = nil, self[start_pos]
    else
      raise "Invalid move"
    end
    p "I moved"
  end

end

# b = Board.new
# b.move_piece([1,1], [4,4])
# puts b.rows