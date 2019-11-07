module Steppable
  
  def moves
    results = []
    arr = move_diffs
    arr.each do |dir|
      ele1 = pos[0] + dir[0]
      ele2 = pos[1] + dir[1]
      results << [ele1 , ele2] if !out_of_range?([ele1,ele2])
    end
    results
  end
  
  # def move_diffs
  # end

  private

end
