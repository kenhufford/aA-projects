require "rspec"
require "first_tdd"

describe "#remove_dups" do
    # let(:arr) {[1,2,1,3,3]}
    it "removes duplicate elements from arr" do
        expect(remove_dups([1,2,1,3,3])).to eq([1,2,3])
    end

    it "removes duplicate elements from arr" do
        expect(remove_dups([3,3,1,2,1])).to eq([3,1,2])
    end
end

describe "#two_sums" do
    let(:arr) {[-1,0,2,-2,1]}
    it "finds indicies of pairs that sum to zero" do
        expect(two_sums(arr)).to eq([[0,4] ,[2,3]])
    end
end

describe "#my_transpose" do
    let(:matrix) {
        [[0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]]
    }   

    it "transposes a 2d array (matrix) if its a square" do
        expect(my_transpose(matrix)).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end

end

describe "#stock_picker" do
    let(:arr) {[1,5,6,2,9,0,2]}

    it "picks the best day to buy and sell a stock for profit" do
        expect(stock_picker(arr)).to eq([0,4])
    end
end

describe "Game" do
    subject(:game){game = Game.new}

    # describe "#get_input" do
    #     context "gets input from user" do
    #         it "gets start and end position from user" do 
    #             expect(game.get_input.empty?).to eq false
    #             options = [0,1,2]
    #             expect(options.include?(game.get_input.first)).to eq true
    #             expect(options.include?(game.get_input.last)).to eq true
    #         end
    #     end
    # end

    describe "#move" do 
        context "moves disc from one pile to another" do
            it "takes in position and moves disc" do
                game.move([0,1])
                expect(game.tower).to eq([[2,3,4,5,6], [1], []])
            end

            it "will not a largerer disc onto a smaller disc" do
                game.move([0,1])
                game.move([0,1])
               
                expect(game.tower).to_not eq ([[3,4,5,6], [2,1], []])
            end

             it "will not move disc if start has no disc" do
                game.move([2,1])
                expect(game.tower).to eq ([[1,2,3,4,5,6], [], []])
            end
        end
    end 

    describe "#win?" do
        context "checks to see if all discs have moved from start tower to diff tower in largest to smallest order" do
            it "has all discs ordered from largest to smallest" do 
                game.tower = ([[], [1,2,3,4,5,6], []])
                expect(game.tower[0].empty? && game.tower[1].empty? || game.tower[0].empty? && game.tower[2].empty?).to be(true)
            end
        end
    end



end