require_relative "./PolyTreeNode.rb"
require "byebug"

class KnightPathFinder
  KNIGHT_MOVE_LIST = [
  [1,2], 
  [2,1],   
  [-1,-2], 
  [-2,-1],
  [1,-2],
  [-2,1],
  [-1,2],
  [2,-1]
]

  attr_reader :root_node
  def initialize(position)
    # debugger
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]
    build_move_tree
    p @considered_positions.count
  end

  def find_path(target)
  
    queue = [@root_node]

    until queue.empty?
      compare = queue.shift
      return trace_path_back(compare) if compare.position == target
      queue += compare.children
    end

    return nil
  end

  def trace_path_back(node)
    return [node.position] if node == @root_node

    trace_path_back(node.parent) + [node.position]
  end

  def self.valid_moves(position)
    valid_moves = []
    KNIGHT_MOVE_LIST.each do |move| 
      new_move = [move[0]+ position[0], move[1]+position[1]]
      if (new_move[0] < 8 && new_move[0] >= 0) && (new_move[1] < 8 && new_move[1] >= 0)
        valid_moves << new_move 
      end
    end
    valid_moves  #[[2,3], [1,1]]
  end

  def new_move_positions(position) #return valid moves that are not considered positions
    moves = KnightPathFinder.valid_moves(position)
    new_moves = moves.select{|ele| !@considered_positions.include?(ele)}
    @considered_positions += new_moves
    new_moves
  end
    
  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      compare = queue.shift
      new_moves_array = new_move_positions(compare.position)
      new_moves_array.each do |child_position|
        child = PolyTreeNode.new(child_position)
        compare.add_child(child)
      end
      queue += compare.children
    end

    return nil

  end


end