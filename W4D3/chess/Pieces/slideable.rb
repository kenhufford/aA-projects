module Slideable
  

  def moves
    results = []
    arr = []
    arr += DIAGONAL_DIRS if self.move_dirs.include?(:diag)
    arr += HORIZONTAL_DIRS if self.move_dirs.include?(:hor)
    arr.each do |dir|
      ele1 = pos[0] + dir[0]
      ele2 = pos[1] + dir[1]
      new_pos = [ele1,ele2]
      # p new_pos
      until out_of_range?(new_pos) #|| 
        results << new_pos.dup
        break if @board[new_pos] != NullPiece.instance
        new_pos[0] += dir[0]
        new_pos[1] += dir[1]
        
      end
    end
    results
  end
  
  def move_dirs
  end

  private
  DIAGONAL_DIRS = [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
  ]
  HORIZONTAL_DIRS = [
      [0,1],
      [0,-1],
      [1,0],
      [-1,0]
  ]
end
