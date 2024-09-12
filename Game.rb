OPTIONS = {
  '1' => 'Камінь',
  '2' => 'Ножиці',
  '3' => 'Папір'
}

def get_user_choice
  choice = ''
  while !OPTIONS.include?(choice)
    puts "Виберіть: 1 - Камінь, 2 - Ножиці, 3 - Папір"
    choice = gets.chomp.strip
    puts "Неправильний вибір. Спробуйте знову." unless OPTIONS.include?(choice)
  end
  OPTIONS[choice]
end

def get_computer_choice
  OPTIONS.values.sample
end

def determine_winner(user_choice, computer_choice)
  if user_choice == computer_choice
    "Нічия!"
  elsif (user_choice == 'Камінь' && computer_choice == 'Ножиці') ||
    (user_choice == 'Ножиці' && computer_choice == 'Папір') ||
    (user_choice == 'Папір' && computer_choice == 'Камінь')
    "Ви перемогли!"
  else
    "Комп'ютер переміг!"
  end
end

def play_again?
  choice = ''
  while choice != 'y' && choice != 'n'
    puts "Грати знову? (y/n)"
    choice = gets.chomp.downcase.strip
    puts "Неправильний вибір. Введіть 'y' для так або 'n' для ні." unless choice == 'y' || choice == 'n'
  end
  choice == 'y'
end

loop do
  user_choice = get_user_choice
  computer_choice = get_computer_choice

  puts "Ваш вибір: #{user_choice}"
  puts "Вибір комп'ютера: #{computer_choice}"

  puts determine_winner(user_choice, computer_choice)

  break unless play_again?
end