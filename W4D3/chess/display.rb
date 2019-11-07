require_relative "board.rb"
require_relative "cursor.rb"
require 'colorize'
class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],@board)
  end

  def render
    print "  "
    (0..7).each do |num|
       print "#{num} ".colorize(:white)
    end
    puts
    
    @board.rows.each_with_index do |row, i|
      print "#{i} ".colorize(:white)
      # p "#{row.map{|piece| piece.to_s}.join(" ")}".colorize(:blue)
      row.each do |piece|
        if @cursor.cursor_pos == piece.pos
          print piece.to_s.colorize(:green)
        elsif piece.color == "white"
          print piece.to_s.colorize(:blue)
        elsif piece.color == "black"
          print piece.to_s.colorize(:red)
        else
          print " "
        end
        print " "
      end
      puts
    end
  end

end

b = Board.new
b.move_piece([1,1], [2,1])
b.move_piece([1,3], [3,3])
b.move_piece([0,2], [2,0])
b.move_piece([0,1], [2,2])
# b.move_piece([0,0], [0,2])
b.move_piece([0,3], [1,3])
b.move_piece([0,4], [0,2])
b.move_piece([6,4], [4,4])
b.move_piece([4,4], [3,3])
d = Display.new(b)
p b.in_check?("white")
d.render
b.move_piece([3,3], [2,2])
p b.in_check?("white")
d.render
b.move_piece([7,5], [4,2])
b.move_piece([7,4], [2,4])
b.move_piece([1,5], [2,5])
b.move_piece([0,2], [0,4])
d.render
p b.in_check?("black")
p b.checkmate?("black")
b.move_piece([0,0], [0,3])
b.move_piece([2,0], [1,1])
b.move_piece([1,1], [2,2])
p b.in_check?("black")
p b.checkmate?("black")
d.render