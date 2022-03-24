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
      expect(@account.balance).to eq(100)
    end

    it 'Should withdraw' do
      @account.deposit(100)
      @account.withdraw(50)
      expect(@account.balance).to eq(50)
    end
  end

  
end