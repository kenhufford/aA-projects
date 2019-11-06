module Slideable
  

  def moves(pos)
    results = []
    arr = []
    arr += DIAGONAL_DIRS if self.move_dirs.include?(:diag)
    arr += HORIZONTAL_DIRS if self.move_dirs.include?(:hor)
    arr.each do |dir|
      temp = pos
      until !out_of_range?(pos + dir)
        temp += dir
        results << temp
      end
    end
    results
  end
  
  def move_dirs
  end

  private
  def out_of_range?(pos)
    return true if pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
    false
  end
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
