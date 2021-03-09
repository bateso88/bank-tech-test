# frozen_string_literal: true

require 'bank_account'

describe 'view statement feature' do
  let(:account) { BankAccount.new }
  before do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
  end

  it 'prints statement' do
    expect do
      account.statement.view
    end.to output("date || credit || debit || balance\n"\
    "#{Time.now.strftime('%d/%m/%Y')} ||  || 500.00 || "\
    "2500.00\n#{Time.now.strftime('%d/%m/%Y')} || 2000."\
    "00 ||  || 3000.00\n#{Time.now.strftime('%d/%m/%Y')}"\
    " || 1000.00 ||  || 1000.00\n").to_stdout
  end

  it 'places the most recent transaction at the top of the statement' do
    expect(account.statement.transactions[0].debit).to eq('500.00')
    expect(account.statement.transactions[0].credit).to be nil
    expect(account.statement.transactions[0].balance).to eq('2500.00')
  end
end
