require 'blackjack'

describe Blackjack do

  let(:blackjack) { Blackjack.new }

  it 'creates a deck of cards upon initialization' do
    expect(blackjack.create_cards.count).to eq(52)
  end

  it 'shuffles the deck of cards' do
    blackjack.create_cards

    expect(blackjack.shuffle_deck.uniq.count).to eq(52)
  end

end
