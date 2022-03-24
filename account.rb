class Account
  attr_reader :balance

  def initialize(balance = 0.0, tax_per_withdraw = 0.1, deposit_profit = 0.05, deposit_profit_limit = 50.0)
    @balance = balance
    @tax_per_withdraw = tax_per_withdraw
    @deposit_profit = deposit_profit
    @deposit_profit_limit = deposit_profit_limit
  end

  def show_balance
    @balance
  end

  def deposit(amount)
    if amount > 0 then
      amount > @deposit_profit_limit ? @balance += amount + amount * @deposit_profit : @balance += amount
    else
      'Invalid amount'
    end
  end

  def withdraw(amount)
    if amount > 0 then
      @balance -= amount + amount * @tax_per_withdraw
      @balance = 0 if @balance < amount
    else
      'Value must be greater than zero'
    end
  end
end