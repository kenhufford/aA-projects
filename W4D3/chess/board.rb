Dir["./Pieces/*.rb"].each {|file| require file }

class Board
  attr_reader :rows

  def initialize
    # nullpiece = NullPiece.instance
    nullpiece = nil
    @rows = Array.new(8) {Array.new(8, NullPiece.instance)}

    self[[7,3]] = King.new("white",self, [7,3])
    self[[7,4]] = Queen.new("white",self, [7,4])
    self[[7,1]] = Knight.new("white",self, [7,1])
    self[[7,6]] = Knight.new("white",self, [7,6])
    self[[7,2]] = Bishop.new("white",self, [7,2])
    self[[7,5]] = Bishop.new("white",self, [7,5])
    self[[7,0]] = Rook.new("white",self, [7,0])
    self[[7,7]] = Rook.new("white",self, [7,7])

    self[[0,3]] = King.new("black",self, [0,3])
    self[[0,4]] = Queen.new("black",self, [0,4])
    self[[0,1]] = Knight.new("black",self, [0,1])
    self[[0,6]] = Knight.new("black",self, [0,6])
    self[[0,2]] = Bishop.new("black",self, [0,2])
    self[[0,5]] = Bishop.new("black",self, [0,5])
    self[[0,0]] = Rook.new("black",self, [0,0])
    self[[0,7]] = Rook.new("black",self, [0,7])

    (0...8).each do |i|
      self[[6,i]] = Pawn.new("white",self, [6,i])
      self[[1,i]] = Pawn.new("black",self, [1,i])
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
      p "#{self[start_pos].valid_moves} are all the valid moves"
    if self[start_pos] != NullPiece.instance && self[start_pos].valid_moves.include?(end_pos)
      self[start_pos].pos = end_pos
      self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
    else
      raise "Invalid move"
    end
    p "I moved"
  end

  def in_check?(color)
    all_moves = []
    self.rows.each do |row|
      row.each do |square|
        all_moves += square.valid_moves
      end
    end

    all_moves.each do |move| 
      return true if self[move].is_a?(King) && self[move].color == color
    end

    false

  end

  def checkmate?(color)
    return false if !in_check?(color)

    self.rows.each do |row|
      row.each do |square|
        all_moves = []
        all_moves = square.valid_moves if square.color == color 
        all_moves.each do |move|
          # temp = NullPiece.instance
          temp1 = self[square.pos]
          temp2 = self[move]
          self[move] = temp1
          self[square.pos] = NullPiece.instance
          if !in_check?(color) 
            self[move] = temp2
            self[square.pos] = temp1
            return false 
          end
          self[move] = temp2
          self[square.pos] = temp1
        end
      end
    end

    return true

  end

end


