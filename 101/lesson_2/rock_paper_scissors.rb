# rock_paper_scissors.rb

# walk through

VALID_CHOICES = ['rock', 'paper', 'scissors']
def prompt(message)
  puts("=> #{message}")
end

def display_output(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (player == 'rock' && computer == 'paper') ||
     (player == 'paper' && computer == 'scissors') ||
     (player == 'scissors' && computer == 'rock')
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do # main
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

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