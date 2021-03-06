def task1(line)
  word = line.split(" ")[1]
  if word[-2, word.length].upcase == 'CS'
    puts 2**word.length
  else
    puts word.reverse
  end
end

def task2
  puts 'Сколько покемонов добавить?'
  num = gets.to_i
  pokes = []
  for i in 1..num
    puts 'Какое имя?'
    name = gets.chomp
    puts 'Какой цвет?'
    color = gets.chomp
    pokes.append({'name' => name, 'color' => color})
  end
  puts pokes
end

def menu
  loop do
    puts '============================'
    puts '1. Первое задание'
    puts '2. Покемоны'
    puts '0. Выход'
    puts '============================'

    choose = gets.to_i
    case choose
    when 1
      puts 'Введи число и слово'
      a = gets.chomp
      task1(a)
    when 2
      task2
    else
      break
    end
  end
end

menu