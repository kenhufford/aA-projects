require "byebug"
class PolyTreeNode
  attr_reader :position, :parent, :children


    def initialize(position)
        @position = position
        @parent = nil
        @children = []
    end

    def parent=(node)  
      @parent.children.keep_if { |ele| ele != self } if @parent != nil
      if node == nil
        @parent == nil
      else
        @parent = node
        if !node.children.include?(self)
          node.children << self
        end
      end
    end

    def add_child(child)
      child.parent = self
    end

 
    # def bfs(target) 
    #   # debugger
    #   queue = [self]

    #   until queue.empty?
    #     compare = queue.shift
    #     return compare.position if compare.position == target

    #     KNIGHT_MOVE_LIST.each do |move| 
    #       new_move = [move[0]+compare.position[0], move[1]+compare.position[1]]
    #       new_node = PolyTreeNode.new(new_move)
    #       compare.add_child(new_node)
    #     end
    #     queue += compare.children
      
    #   end
    #   return nil
    # end


end
