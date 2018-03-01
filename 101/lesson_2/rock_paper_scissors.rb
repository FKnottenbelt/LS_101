# rock_paper_scissors.rb
# ruby 2.4.1p111 (2017-03-22 revision 58053)

VALID_CHOICES = %w(rock paper scissors Spock lizard)
VALID_ABREVIATION = %w(r p s S l)
LINE_WIDTH = 80
WINS_TO_COMPLETE_MATCH = 5

def prompt(message)
  puts("=> #{message}")
end

def clear_screen
  system('clear') || system('cls')
end

def display_welcome
  clear_screen
  puts
  prompt "Let's play a game!".center(LINE_WIDTH)
  prompt "First one to win 5 times in a row wins the match!".center(LINE_WIDTH)
end

def keep_going?
  answer = ''

  loop do
    prompt 'Do you want to play again?'
    answer = gets.chomp.downcase

    break if %w(y yeah yes yep n no nope).include?(answer)
    prompt 'Please answer y (yes) or n (no)'
  end

  %w(y yeah yes yep).include?(answer)
end

def win?(first, second)
  winner = { rock: ['scissors', 'lizard'],
             paper: ['rock', 'Spock'],
             scissors: ['paper', 'lizard'],
             lizard: ['Spock', 'paper'],
             Spock: ['scissors', 'rock'] }
  winner[first.to_sym].include?(second)
end

def autocomplete_choice(choice)
  full_text = { r: 'rock',
                p: 'paper',
                s: 'scissors',
                S: 'Spock',
                l: 'lizard' }
  full_text[choice.to_sym]
end

def display_output(player, computer)
  result = if win?(player, computer)
             'You won!'
           elsif win?(computer, player)
             'Computer won!'
           else
             "It's a tie!"
           end
  prompt <<-MSG
    You chose: #{player}. The computer chose: #{computer}.
            --------- #{result} ---------
  MSG
end

def display_grand_winner(score)
  winner = score[:player] == WINS_TO_COMPLETE_MATCH ? 'YOU' : 'Computer'
  prompt "And the grand winner is.....#{winner}!!"
end

def display_score(score)
  prompt <<-MSG
    The score is: You:#{score[:player]}, Computer: #{score[:computer]}

  MSG
end

def keep_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

def reset_score(score)
  score[:player] = 0
  score[:computer] = 0
end

score = { player: 0,
          computer: 0 }

display_welcome
loop do # main
  choice = ''

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}.
    (You may type the first letter only)."
    choice = gets.chomp

    choice = %w(R P L).include?(choice) ? choice.downcase : choice
    if VALID_ABREVIATION.include?(choice)
      choice = autocomplete_choice(choice)
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('That is not a valid choice')
    end
  end

  computer_choice = VALID_CHOICES.sample
  display_output(choice, computer_choice)

  keep_score(choice, computer_choice, score)
  display_score(score)

  if score.value?(WINS_TO_COMPLETE_MATCH)
    display_grand_winner(score)
    reset_score(score)

    break unless keep_going?
    clear_screen
  end
end

prompt("Thank you for playing, good bye!")
