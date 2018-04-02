# twenty_one.rb

##########################
# 1. Initialize deck (done)
# 2. Deal cards to player and dealer (done)
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

SUITES = { 'h' => 'hearts', 'd' => 'diamonds', 'c' => 'clubs', 's' => 'spades' }

def add_number_cards!(cards)
  suites = SUITES.keys
  counter = 2
  loop do
    break if counter == 11
    suites.each do |suite|
      cards << [counter, suite]
    end
    counter += 1
  end
  cards
end

def add_picture_cards!(cards)
  suites = SUITES.keys
  picture_cards = ['jack', 'queen', 'king', 'ace']
  picture_cards.each do |picture|
    suites.each do |suite|
      cards << [picture, suite]
    end
  end
  cards
end

def initialize_unused_cards!
  number_cards = add_number_cards!([])
  picture_cards = add_picture_cards!([])
  number_cards + picture_cards
end

def initialize_deck!(deck)
  deck[:stock] = initialize_unused_cards!
  deck[:player] = []
  deck[:dealer] = []
  deck
end

def deal(deck, number_of_cards_to_deal, *current_player)
  current_player.each do |player|
    number_of_cards_to_deal.times do
      card = deck[:stock].sample
      deck[:stock].delete_at(deck[:stock].index(card))
      deck[player.to_sym] << card
    end
  end
end

def split_off_values(hand)
  hand.map do |card|
    card[0]
  end
end

def calculate_hand_total(deck, current_player)
  hand = deck[current_player.to_sym].dup
  hand = split_off_values(hand)

  number_of_aces = hand.count('ace')
  hand.delete('ace')

  hand.map! do |card|
    ['jack', 'queen', 'king'].include?(card) ? 10 : card
  end

  hand_no_ace_total = hand.sum

  hand_total = hand_no_ace_total
  number_of_aces.times do
    hand_total + 11 > 21 ? (hand_total += 1) : (hand_total += 11)
  end

  hand_total
end
#####################################
deck = initialize_deck!({})

number_of_cards_to_deal = 2
deal(deck, number_of_cards_to_deal, 'player', 'dealer')

number_of_cards_to_deal = 1
deal(deck, number_of_cards_to_deal, 'player')

calculate_hand_total(deck, 'player')
p deck
