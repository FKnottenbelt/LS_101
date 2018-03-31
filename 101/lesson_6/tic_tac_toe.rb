# tic_tac_toe.rb
# ==================
# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!
# ===========================
# Step 1: Set up and display the board (done)
# Step 2: Player turn (done)
# Step 3: The main game loop (done)
# Step 4: Determining the winner (done)
# Step 5: Play again (done)
# Step 6: refactor with rubocop (done)
# add joiner (done)
# keep score (done)

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SCORE = 2

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear' || system(cls)
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
  square = empty_squares(brd).sample
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
##############################################################

loop do # main
  score = { player: 0, computer: 0 }

  loop do # match
    board = initialize_board

    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
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
      prompt "Do you want to continue this match? (y/n)?"
      answer = gets.chomp
      break unless answer.downcase.start_with?('y')
    end
  end # end match

  prompt "Play a new match? (y/n)?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end main

prompt "Thanks for playing Tic Tac Toe. Good bye!"
