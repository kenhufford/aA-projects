require "byebug"
class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)  #nil
        @parent.children.keep_if { |ele| ele != self } if @parent != nil

        if node == nil
            @parent = nil
        else
            @parent = node 
            if !node.children.include?(self)
                node.children << self
            end
        end
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise "Error" if !self.children.include?(node)
        node.parent = nil 
    end
    
    def dfs(target)
        return self if self.value == target
        
        self.children.each do |child| 
            result = child.dfs(target)
            return result if result != nil
        end

        return nil
    end

    def bfs(target)
        queue = [self]
        
        until queue.empty?
            compare = queue.shift
            return compare if compare.value == target
            queue += compare.children
        end
        return nil
    end

end

    

# Create a queue with root
# Until queue.empty?
# Dequeue node
# Return node if == target
# Enqueue node’s children
# Return nil

