class Blackjack

  attr_reader :cards

  def initialize
    @cards = []
  end

  def create_cards
    @suits = ['of Clubs', 'of Hearts', 'of Spades', 'of Diamonds']
    create_number_cards
    create_face_cards
    @cards
  end

  def shuffle_deck
    range = @cards.length - 1
    rand_nums = (0..@cards.length - 1).to_a
    shuffled_cards = []
    scratch = @cards.clone
    (@cards.length).times do
      current_roll = rand(0..range)
      shuffled_cards << scratch[current_roll]
      scratch.delete_at(current_roll)
      rand_nums.delete_at(current_roll)
      range -= 1
    end
    @cards = shuffled_cards
  end

private

  def create_number_cards
    @suits.each do |suit|
      (2..10).each do |card|
        @cards << card.to_s + ' ' + suit
      end
    end
  end

  def create_face_cards
    numbers = ['Ace', 'Jack', 'Queen', 'King']
    @suits.each do |suit|
      numbers.each do |num|
        @cards << num + ' ' + suit
      end
    end
  end

end
