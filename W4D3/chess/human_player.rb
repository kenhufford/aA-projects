require "player.rb"

class HumanPlayer < Player
  def make_move(board)
    @display.cursor.get_input
  end
end