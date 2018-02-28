# rock_paper_scissors.rb

# walk through

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

def display_output(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def complete_choice(choice)
  full_text = { r: 'rock',
                p: 'paper',
                s: 'scissors',
                S: 'Spock',
                l: 'lizard' }
  full_text[choice.to_sym]
end

loop do # main
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}. You may type the first
      letter only."
    choice = gets.chomp

    if VALID_ABREVIATION.include?(choice)
      choice = complete_choice(choice)
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

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing, good bye!")
