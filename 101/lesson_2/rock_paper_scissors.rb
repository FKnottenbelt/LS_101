# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors Spock lizard)
VALID_ABREVIATION = %w(r p s S l)

def prompt(message)
  puts("=> #{message}")
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
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def display_grand_winner(score)
  score[:player] == 5 ? winner = 'YOU' : winner = 'Computer'
  prompt "And the grand winner is.....#{winner}!!"
end

def display_score(score)
  prompt "The score is: You:#{score[:player]}, Computer: #{score[:computer]}"
end

def keep_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
     score[:computer] += 1
  else
    # it's a tie. We don't want to count those
  end
end

def reset_score(score)
  score[:player] = 0
  score[:computer] = 0
end

score = { player: 0,
          computer: 0,
          tie: 0 }

loop do # main
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}. You may type the first
      letter only."
    choice = gets.chomp

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

  puts "You chose: #{choice}. The computer chose: #{computer_choice}."
  display_output(choice, computer_choice)
  keep_score(choice, computer_choice, score)
  display_score(score)

  if score.has_value?(5)
     display_grand_winner(score)
     reset_score(score)

     prompt("Do you want to play again?")
     answer = gets.chomp
     break unless answer.downcase.start_with?('y')
  end
end

prompt("Thank you for playing, good bye!")

