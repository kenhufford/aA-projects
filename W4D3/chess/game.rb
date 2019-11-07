require_relative "board.rb"
require_relative "human_player.rb"
class Game
  def initialize
    @board = Board.new
    @player_1 = HumanPlayer.new("white",@board)
    @player_2 = HumanPlayer.new("black",@board)
    @currentplayer = player_1
  end
  def play
    current_pos = @currentplayer.make_move
    next_pos = @currentplayer.make_move
    
  end

end