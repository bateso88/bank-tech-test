# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  create_bank_account_instance_and_doubles_for_statement_class_and_statement

  context 'deposit' do
    it 'updates statement' do
      expect(statement).to receive(:update).with(100)
      account.deposit(100)
    end

    it 'throws error if deposit amount is negative' do
      expect { account.withdraw(-100) }.to raise_error 'Amount must be positive'
    end
  end

  context 'withdraw' do
    it 'updates statement' do
      expect(statement).to receive(:update).with(-50)
      account.withdraw(50)
    end

    it 'throws error if withdrawal amount is greater than balance' do
      expect { account.withdraw(100) }.to raise_error 'Insufficient funds'
    end

    it 'throws error if withdrawal amount is negative' do
      expect { account.withdraw(-100) }.to raise_error 'Amount must be positive'
    end
  end
end
