# twenty_one_bonus.rb

SUITES = { 'h' => 'hearts', 'd' => 'diamonds', 'c' => 'clubs', 's' => 'spades' }
DEALER_MAX = 17
BUST = 21
MATCH = 2

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear' || system(cls)
end

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
  deck
end

def open_game(player, dealer, deck)
  2.times do |_|
    deal(deck, player)
    deal(deck, dealer)
  end
end

def deal(deck, current_player)
  card = deck[:stock].sample
  deck[:stock].delete_at(deck[:stock].index(card))
  current_player[:hand] << card
  update_hand_total(deck, current_player)
end

def split_off_values(hand)
  hand.map do |card|
    card[0]
  end
end

def calculate_hand_total(deck, current_player)
  hand = current_player[:hand].dup
  hand = split_off_values(hand)

  number_of_aces = hand.count('ace')
  hand.delete('ace')

  hand.map! do |card|
    ['jack', 'queen', 'king'].include?(card) ? 10 : card
  end

  hand_no_ace_total = hand.sum

  hand_total = hand_no_ace_total
  number_of_aces.times do
    hand_total + 11 > BUST ? (hand_total += 1) : (hand_total += 11)
  end

  hand_total
end

def show_dealer_card(dealer)
  card = dealer[:hand].sample
  prompt "Dealer card is: #{card[0]} of #{SUITES[card[1]]}"
end

def hit_or_stay(deck, current_player)
  total = calculate_hand_total(deck, current_player)
  total <= DEALER_MAX ? 'hit' : 'stay'
end

def dealer_turn(deck, dealer)
  loop do
    action = hit_or_stay(deck, dealer)
    if action == 'hit'
      deal(deck,dealer)
    else
      break
    end
  end
end

def declare_winner(player, dealer)
  player_total = player[:total]
  dealer_total = dealer[:total]
  winner = if player_total > dealer_total
             'player'
           elsif player_total == dealer_total
             'tie'
           else
             'dealer'
           end

  puts <<-MSG

                    The winner is: #{winner}!
               score: player: #{player_total} - dealer: #{dealer_total}

        MSG
end

def update_hand_total(deck, current_player)
  total = calculate_hand_total(deck, current_player)
  current_player[:total] = total
end

def bust?(deck, current_player)
  total = current_player[:total]
  total > BUST ? true : false
end

def show_hand(current_player)
  hand = current_player[:hand]
  pretty_hand = hand.map do |card|
    card[0].to_s + ' of ' + SUITES[card[1]]
  end
  prompt "Your hand: #{pretty_hand.join(', ')}. Total is: " \
  "#{current_player[:total]}"
end

def ask_hit_or_stay
  answer = ''
  loop do
    prompt "Do you want to hit or stay? (h/s)"
    answer = gets.chomp.downcase
    break if %w[h s].include?(answer)
    prompt "Please type h for hit or s for stay"
  end
  answer
end

def player_turn(deck, player)
  loop do
    show_hand(player)
    answer = ask_hit_or_stay

    if answer == 'h'
      deal(deck, player)
      break if bust?(deck, player)
    else
      break
    end
  end
end

def display_welcome
  puts <<-MSG

                     Welcome to Twenty-One!

        MSG
end

def keep_going?(question)
  answer = ''
  loop do
    prompt question
    answer = gets.chomp.downcase
    break if %w[y yeah yes yep n no nope].include?(answer)
    prompt 'Please answer y (yes) or n (no)'
  end
  %w[y yeah yes yep].include?(answer)
end
########################################
clear_screen
display_welcome

score = { player: 0, dealer: 0 }

loop do
  deck = initialize_deck!({})
  player = { hand: [], total: 0, bust: false }
  dealer = { hand: [], total: 0, bust: false }

  open_game(player, dealer, deck)
  show_dealer_card(dealer)

  player_turn(deck, player)
  if bust?(deck, player)
    prompt "Oeps, you got a #{player[:hand].last.first} and " \
    "went bust... Dealer wins."
  else
    dealer_turn(deck, dealer)
    if bust?(deck, dealer)
      prompt 'Dealer went bust! You won!'
    else
      declare_winner(player, dealer)
    end
  end

  break unless keep_going?("Play again? (y/n)?")
  clear_screen
end

prompt "Thank you for playing Twenty-One. Good bye!"
