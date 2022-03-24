class Account
  attr_reader :balance

  def initialize(balance = 0.0, tax_per_withdraw = 0.1)
    @balance = balance
    @tax_per_withdraw = tax_per_withdraw
  end

  def show_balance
    @balance
  end

  def deposit(amount)
    amount > 50 ? @balance += amount + amount * 0.05 : @balance += amount
  end

  def withdraw(amount)
    @balance -= amount + amount * @tax_per_withdraw
  end
end