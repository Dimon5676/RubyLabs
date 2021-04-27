class CashMachine

  def initialize
    @balance = 100.0
  end

  def deposit(sum)
    if sum <= 0
      'Сумма должна быть больше нуля'
    else
      @balance += sum
      "Ваш новый баланс: #{@balance}"
    end
  end

  def withdraw(sum)
    if sum <= 0
      'Сумма должна быть больше нуля'
    elsif sum > @balance
      'Недостаточно средств'
    else
      @balance -= sum
      "Ваш новый баланс: #{@balance}"
    end
  end

  def balance
    "Ваш баланс: #{@balance}"
  end
end
