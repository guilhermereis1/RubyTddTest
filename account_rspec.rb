require 'rspec'
require_relative 'account'

describe Account do
  context '#initialize' do
    before do
      @account = Account.new
    end

    it 'Initialize Account' do
      expect(@account.balance).to eq(0)
    end

    it 'Should show balance' do
      expect(@account.show_balance).to eq(0)
    end

    it 'Should deposit' do
      @account.deposit(100)
      expect(@account.balance).to eq(105.0)
    end

    it 'Should withdraw' do
      @account.deposit(100)
      @account.withdraw(50)
      expect(@account.balance).to eq(50.0)
    end
  end
  
  context '#account has tax to withdraw' do
    before do
      @account = Account.new
    end

    it 'Each withdraw should have a tax 10%' do
      @account.deposit(100.0)
      @account.withdraw(10.0)
      expect(@account.balance).to eq(94.0)
    end
  end

  context '#account has a profit of 5% each deposit above 50' do
    before do
      @account = Account.new
    end

    it 'Every deposit above 50, the balance receives 5% more profit' do
      @account.deposit(100.0)
      @account.deposit(50.0)
      expect(@account.balance).to eq(155.0)
    end
  end

  context '#validations account' do
    before do
      @account = Account.new
    end

    it 'Withdraw only the amount you have available' do
      @account.deposit(100.0)
      @account.withdraw(150.0)
      @account.deposit(300.0)
      @account.withdraw(1000.0)
      expect(@account.balance).to eq(0.0)
    end

    it "If withdraw equal zero, return message 'Value must be greater than zero'" do
      @account.deposit(100.0)
      expect(@account.withdraw(0.0)).to eq("Value must be greater than zero")
    end

    it 'If deposit equal zero, return message "Value must be greater than zero"' do
      expect(@account.deposit(0.0)).to eq("Invalid amount")
    end
  end
end