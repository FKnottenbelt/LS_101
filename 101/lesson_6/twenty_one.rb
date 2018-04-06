# twenty_one.rb

SUITES = { 'h' => 'hearts', 'd' => 'diamonds', 'c' => 'clubs', 's' => 'spades' }

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

def show_dealer_card(deck)
  card = deck[:dealer].sample
  prompt "Dealer card is: #{card[0]} of #{SUITES[card[1]]}"
end

def hit_or_stay(deck, current_player)
  total = calculate_hand_total(deck, current_player)
  total <= 17 ? 'hit' : 'stay'
end

def dealer_turn(deck)
  number_of_cards_to_deal = 1

  loop do
    action = hit_or_stay(deck, 'dealer')
    if action == 'hit'
      deal(deck, number_of_cards_to_deal, 'dealer')
    else
      break
    end
  end
end

def declare_winner(deck)
  player_total = calculate_hand_total(deck, 'player')
  dealer_total = calculate_hand_total(deck, 'dealer')
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

def bust?(deck, current_player)
  total = calculate_hand_total(deck, current_player)
  total > 21 ? true : false
end

def show_hand(deck, current_player)
  hand = deck[current_player.to_sym]
  pretty_hand = hand.map do |card|
    card[0].to_s + ' of ' + SUITES[card[1]]
  end
  prompt "Your hand: #{pretty_hand.join(', ')}"
end

def ask_hit_or_stay
  answer = ''
  loop do
    prompt "Do you want to hit or stay?"
    answer = gets.chomp.downcase
    break if %w[hit stay h s].include?(answer)
    prompt "Please choose hit or stay"
  end
  answer
end

def player_turn(deck)
  number_of_cards_to_deal = 1
  loop do
    show_hand(deck, 'player')
    answer = ask_hit_or_stay

    if ['hit', 'h'].include?(answer)
      deal(deck, number_of_cards_to_deal, 'player')
      break if bust?(deck, 'player')
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

clear_screen
display_welcome

loop do
  deck = initialize_deck!({})

  number_of_cards_to_deal = 2
  deal(deck, number_of_cards_to_deal, 'player', 'dealer')
  show_dealer_card(deck)

  player_turn(deck)
  if bust?(deck, 'player')
    prompt "Oeps, you went bust... Dealer wins."
  else
    dealer_turn(deck)
    if bust?(deck, 'dealer')
      prompt 'Dealer went bust! You won!'
    else
      declare_winner(deck)
    end
  end

  break unless keep_going?("Play again? (y/n)?")
  clear_screen
end

prompt "Thank you for playing Twenty-One. Good bye!"
