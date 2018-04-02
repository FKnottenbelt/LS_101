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

def initialize_unused_cards!
  cards = []
  # add number values for 4 suites
  counter = 2
  loop do
    break if counter == 11
    4.times { cards << counter }
    counter += 1
  end

  # add picture cards for 4 suites
  cards << ['jack'] * 4
  cards << ['queen'] * 4
  cards << ['king'] * 4
  cards << ['ace'] * 4
  cards.flatten!
end

def initialize_deck!(deck)
  deck[:deck] = initialize_unused_cards!
  deck[:player] = []
  deck[:dealer] = []
  deck
end

def deal(deck, number_of_cards_to_deal, *current_player)
  current_player.each do |player|
    number_of_cards_to_deal.times do
      card = deck[:deck].sample
      deck[:deck].delete_at(deck[:deck].index(card))
      deck[player.to_sym] << card
    end
  end
end

def calculate_hand_total(deck, current_player)
  hand = deck[current_player.to_sym].dup
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
