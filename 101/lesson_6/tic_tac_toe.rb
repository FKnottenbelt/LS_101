# tic_tac_toe.rb
# ==================

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SCORE = 2
FIRST_PLAYER = 'choose' # "player", "computer", or "choose".

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear' || system(cls)
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts "You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    open_squares = joinor(empty_squares(brd))
    prompt "Choose a square (#{open_squares}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = find_at_risk_square(brd, COMPUTER_MARKER)
  square = find_at_risk_square(brd, PLAYER_MARKER) if square.nil?
  square = 5 if square.nil? && brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample if square.nil?
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def update_score(score, round_winner)
  score[round_winner.downcase.to_sym] += 1
end

def display_score(score)
  puts <<-MSG
       The score is:
       You: #{score[:player]} - Computer: #{score[:computer]}
  MSG
end

def find_at_risk_square(brd, marker)
  at_risk_square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      at_risk_square = line.select { |square| brd[square] == INITIAL_MARKER }
      break if !at_risk_square.empty?
    end
  end
  at_risk_square.nil? ? nil : at_risk_square[0]
end

def choose_first_player
  answer = ''
  loop do
    prompt "Who plays first? (p for player/ c for computer)"
    answer = gets.chomp
    break if %w[p , c].include?(answer.downcase)
    prompt 'Please answer p (player) or c (computer)'
  end
  answer = 'player' if answer == 'p'
  answer = 'computer' if answer == 'c'
end

def set_first_player
  case FIRST_PLAYER
  when 'choose'
    choose_first_player
  when 'player'
    'player'
  when 'computer'
    'computer'
  end
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

def place_piece!(brd, current_player)
  case current_player
  when 'player'
    player_places_piece!(brd)
  when 'computer'
    computer_places_piece!(brd)
  end
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
puts <<-MSG
                     Welcome to Tic Tac Toe!

                 We will play #{WINNING_SCORE} rounds per match
             First one to win #{WINNING_SCORE} rounds wins the match!

        MSG

loop do # main
  score = { player: 0, computer: 0 }
  current_player = set_first_player

  loop do # match
    board = initialize_board

    loop do
      display_board(board) if current_player == 'player'
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end # end round

    display_board(board)

    if someone_won?(board)
      round_winner = detect_winner(board)
      prompt "#{round_winner} won this round!"
      update_score(score, round_winner)
    else
      prompt "It's a tie!"
    end

    display_score(score)

    if score.values.include?(WINNING_SCORE)
      match_winner = score.key(WINNING_SCORE).capitalize
      prompt "#{match_winner} won this match!"
      break
    else
      break unless keep_going?("Do you want to continue this match? (y/n)?")
    end
  end # end match

  break unless keep_going?("Play a new match? (y/n)?")
end # end main

prompt "Thanks for playing Tic Tac Toe. Good bye!"
