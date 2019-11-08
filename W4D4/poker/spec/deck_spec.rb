require "rspec"
require "deck"

describe "Deck" do
    let (:deck) {deck = Deck.new}
    let (:card) {double("card")}
    describe "#initialize" do
        it "creates 52 cards and puts them into array" do   
            expect(deck.cards.length).to eq(52)
        end
    end

    describe "#draw_card" do
        it "draws a new card" do
            length = deck.cards.length
            deck.draw_card
            expect(deck.cards.length).to eq(length-1)
            expect(deck.draw_card.is_a?(Card)).to eq(true)
        end
    end

    describe "#shuffle" do
        it "shuffles" do
            past_deck = deck.cards.dup
            deck.deck_shuffle
            expect(deck.cards == past_deck).to eq(false)
        end
    end 
end

describe "Deck" do
    let (:deck) {deck = Deck.new}
    describe "#initialize" do
        it "52 unique cards" do   
            expect(deck.cards.uniq == deck.cards).to eq(true)
        end
    end
end
