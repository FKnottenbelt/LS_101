# twenty_one_bonus.rb

SUITES = { 'h' => 'hearts', 'd' => 'diamonds', 'c' => 'clubs', 's' => 'spades' }
DEALER_MAX = 17
BUST = 21
MATCH = 2
LINE_WIDTH = 80

def prompt(msg)
  puts "=> #{msg}"
end

def multi_line_prompt(messages_array)
  puts
  messages_array.each do |line|
    puts line.center(LINE_WIDTH)
  end
  puts
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
  update_hand_total(current_player)
end

def split_off_values(hand)
  hand.map do |card|
    card[0]
  end
end

def calculate_hand_total(current_player)
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

def hit_or_stay(current_player)
  total = calculate_hand_total(current_player)
  total <= DEALER_MAX ? 'hit' : 'stay'
end

def dealer_turn(deck, dealer)
  loop do
    action = hit_or_stay(dealer)
    if action == 'hit'
      deal(deck, dealer)
    else
      break
    end
  end
end

def display_round_winner(player, dealer, winner, score)
  message = []
  message << "The winner of this round is: #{winner}!"
  message << "score: player: #{player[:total]} - dealer: #{dealer[:total]}"
  message << "rounds score: player: #{score[:player]} - dealer: " \
             "#{score[:dealer]}"
  message << "(win #{MATCH} rounds to win a match)"
  multi_line_prompt(message)
end

def display_match_winner(winner, score)
  message = []
  message << "The winner of this match is: #{winner}!"
  message << "score: player: #{score[:player]} - dealer: #{score[:dealer]}"
  multi_line_prompt(message)
end

def update_score(score, winner)
  return if winner == 'tie'
  score[winner.to_sym] += 1
end

def declare_round_winner(player, dealer)
  player_total = player[:total]
  dealer_total = dealer[:total]

  if player_total > dealer_total
    'player'
  elsif player_total == dealer_total
    'tie'
  else
    'dealer'
  end
end

def declare_match_winner(score)
  if score[:player] == score[:dealer]
    'tie'
  else
    score.key(score.values.max).to_s
  end
end

def update_hand_total(current_player)
  total = calculate_hand_total(current_player)
  current_player[:total] = total
end

def bust?(current_player)
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

def player_turn(deck, player, score)
  loop do
    show_hand(player)
    show_score(score)
    answer = ask_hit_or_stay

    if answer == 'h'
      deal(deck, player)
      break if bust?(player)
    else
      break
    end
  end
end

def display_welcome
  puts <<-MSG

                     Welcome to Twenty-One!

              First to win #{MATCH} rounds, wins the match

You are trying to get a card total as close as possible to #{BUST}
        If you go over you are bust and lose the round

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

def show_score(score)
  prompt "The rounds score is (get #{MATCH} to win): " \
  "player: #{score[:player]} - dealer: #{score[:dealer]}"
  puts
end
########################################
clear_screen
display_welcome

loop do # match
  score = { player: 0, dealer: 0 }
  player = {}
  dealer = {}

  loop do # round
    deck = initialize_deck!({})
    player = { hand: [], total: 0, bust: false }
    dealer = { hand: [], total: 0, bust: false }

    open_game(player, dealer, deck)
    show_dealer_card(dealer)

    player_turn(deck, player, score)
    if bust?(player)
      prompt "Oeps, you got a #{player[:hand].last.first} and " \
      "went bust... Dealer wins."
      score[:dealer] += 1
      show_score(score)
    else
      dealer_turn(deck, dealer)
      if bust?(dealer)
        prompt 'Dealer went bust! You won!'
        score[:player] += 1
        show_score(score)
      else
        winner = declare_round_winner(player, dealer)
        update_score(score, winner)
        display_round_winner(player, dealer, winner, score)
      end
    end

    break if score.values.include?(2)
    break unless keep_going?("Play an other round? (y/n)?")
    clear_screen
  end # round

  winner = declare_match_winner(score)
  display_match_winner(winner, score)
  break unless keep_going?("Play an other match? (y/n)?")
end # match
prompt "Thank you for playing Twenty-One. Good bye!"
