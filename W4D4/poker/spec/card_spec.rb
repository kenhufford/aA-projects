require "rspec"
require "card"

describe "Card" do
    subject(:card){card = Card.new("heart", "2")}
    describe "#initialize" do
        it "set suit & value" do
            expect(card.suit).to eq("heart")
            expect(card.value).to eq("2")
        end
    end
end