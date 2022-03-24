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
    it 'Each withdraw should have a tax 10%' do
      @account = Account.new
      @account.deposit(100.0)
      @account.withdraw(10.0)
      expect(@account.balance).to eq(94.0)
    end
  end

  context '#account has a profit of 5% each deposit above 50' do
    it 'Every deposit above 50, the balance receives 5% more profit' do
      @account = Account.new
      @account.deposit(100.0)
      @account.deposit(50.0)
      expect(@account.balance).to eq(155.0)
    end
  end
end