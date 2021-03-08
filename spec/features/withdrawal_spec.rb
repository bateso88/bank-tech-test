# frozen_string_literal: true

require 'bank_account'

describe 'withdrawal feature' do
  let(:account) { BankAccount.new }
  it 'creates a new transaction with correct stats' do
    account.deposit(3000)
    account.withdraw(3000)
    expect(account.statement.transactions[0]).to be_a Transaction
    expect(account.statement.transactions[0].debit).to eq '3000.00'
    expect(account.statement.transactions[0].credit).to be nil
    expect(account.statement.transactions[0].balance).to eq '0.00'
    expect(account.statement.transactions[0].date).to eq(Time.now.strftime('%d/%m/%Y'))
  end
end
