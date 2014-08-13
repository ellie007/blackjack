require 'blackjack'
require 'strings'

describe Blackjack do

  let(:strings) { Strings.new }
  let(:blackjack) { Blackjack.new({}, strings) }

  it 'creates a deck of cards upon initialization' do
    expect(blackjack.cards.count).to eq(52)
 end

  it 'shuffles the deck of cards' do
    expect(blackjack.shuffle_deck.uniq.count).to eq(52)
  end

  it '' do
  end

end
