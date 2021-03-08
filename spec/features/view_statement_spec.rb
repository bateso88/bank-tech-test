# frozen_string_literal: true

require 'bank_account'

describe 'view statement feature' do
  let(:account) { BankAccount.new }
  it 'prints statement' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect do
      account.statement.view
    end.to output("date || credit || debit || balance\n08/03/2021 ||  || 500.00 || "\
    "2500.00\n08/03/2021 || 2000.00 ||  || 3000.00\n08/03/2021 || 1000.00 ||  || 1000.00\n").to_stdout
  end
end
