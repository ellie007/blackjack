class Blackjack

  attr_reader :cards

  def initialize(io, strings)
    @io = io
    @strings = strings

    @cards = []
    @players_cards = []
    @dealer_cards = []

    create_cards
end

  def begin_game
    deal_initial_cards
    deal_for_player
#    deal_for_dealer
  end

  def deal_for_player
    @io.output(@strings.bust_message) && return if add_card_values(@players_cards) >= 21

    @io.output(@strings.player_turn_message)
    input = @io.input.to_i
    if input == 1
      deal_for_player
    else
    end
  end

  def add_card_values(cards)
    value = 0
    cards.each do |card|
      value += card.last
    end
    value
  end

  def deal_initial_cards
    initial_cards = @cards.sample(4)
    @players_cards = initial_cards[0], initial_cards[1]
    @dealers_cards = initial_cards[2], initial_cards[3]
    remove_from_deck(initial_cards)
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

  def create_cards
    @suits = ['of Clubs', 'of Hearts', 'of Spades', 'of Diamonds']
    create_number_cards
    create_face_cards
    @cards
  end

  def create_number_cards
    @suits.each do |suit|
      (2..10).each do |num|
        @cards << [num.to_s + ' ' + suit, num]
      end
    end
  end

  def create_face_cards
    numbers = ['Ace', 'Jack', 'Queen', 'King']
    @suits.each do |suit|
      numbers.each do |num|
        if num == 'Ace'
          @cards << [num + ' ' + suit, 1, 11]
        else
          @cards << [num + ' ' + suit, 10]
        end
      end
    end
  end

  def remove_from_deck(cards)
   cards.each { |card| @cards.delete(card) }
  end

end
