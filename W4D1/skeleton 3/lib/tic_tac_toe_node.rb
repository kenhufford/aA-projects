
require "byebug"
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :node, :prev_move_pos
  def initialize(board, mark, prev_move_pos = nil)
    # debugger
    @board = board
    @next_mover_mark = mark
    @node = self
    @prev_move_pos = prev_move_pos
    @children = []
    self.children
  end

  def children
    debugger
    (0...3).each do |i|
      (0...3).each do |j|
        if board[i,j].empty?
          new_node = TicTacToeNode.new(board, @next_mover_mark, self)
          new_node.board[i,j] = next_mover_mark
          new_node.next_mover_mark == :x ? new_node.next_mover_mark = :o : new_node.next_mover_mark = :x
          children << new_node
        end
      end
    end
    children
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
  end
end
