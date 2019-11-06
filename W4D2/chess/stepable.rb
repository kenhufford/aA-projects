module Slideable
  
  def moves(pos)
    results = []
    arr = move_diffs
    arr.each do |dir|
      results << pos + dir
    end
    results
  end
  
  def move_diffs
  end

  private
  def out_of_range?(pos)
    return true if pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
    false
  end
end
