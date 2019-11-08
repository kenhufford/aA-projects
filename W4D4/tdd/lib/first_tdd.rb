def remove_dups(arr)
    hash = {}
    arr.each do |ele|
        hash[ele] = ele

    end
    return hash.keys
end

def two_sums(arr)
    results = []
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            if i2 > i1
              results << [i1,i2]  if ele1 + ele2 == 0
            end
        end
    end
    results
end

def my_transpose(matrix)
    results = []
    (0...matrix.length).each do |i|
        temp = []
        (0...matrix.length).each do |j|
            temp << matrix[j][i]
        end
        results << temp
    end
    results
end

def stock_picker(arr)
    results = nil
    max_profit = 0
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            if i2 > i1
              if ele2 - ele1 > max_profit
                 results = [i1,i2] 
                 max_profit = ele2 - ele1
              end
            end
        end
    end
    results

end

class Game
    attr_accessor :tower
    def initialize
        @tower = [[1,2,3,4,5,6], [], []]
    end

    def get_input
        start = nil
        final = nil
        until [0,1,2].include?(start) || [0,1,2].include?(final)
            puts "Move ring from tower 0, 1 or 2"
            start = gets.chomp.to_i
            puts "Move ring to tower 0, 1 or 2"
            final = gets.chomp.to_i
        end
        response = [start, final]
    end

    def move(pos)
        
        first = @tower[pos[0]].first 
        final = @tower[pos[-1]].first
        if first.nil? 
            puts "invalid move. no ring at start positon"
            return
        end

        if final == nil || final > first
            ring = @tower[pos[0]].shift
             @tower[pos[-1]].unshift(ring)
        else
            puts "You cannot put a larger disc onto a smaller disc"
            return
        end

    end

    def win?
        self.tower[0].empty? && self.tower[1].empty? || self.tower[0].empty? && self.tower[2].empty?
    end

    def play
        until win?
            print @tower
            pos = get_input
            move(pos)
        end
        puts "you win!"
    end

end

game = Game.new
game.play
