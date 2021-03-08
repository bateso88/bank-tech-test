# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:statement) { double('statement', update: true, balance: 50) }
  let(:statement_class) { double('statement_class', new: statement) }
  let(:account) { BankAccount.new(statement_class) }

  context 'deposit' do
    it { is_expected.to respond_to :deposit }

    it 'updates statement' do
      expect(statement).to receive(:update).with(100)
      account.deposit(100)
    end
  end

  context 'withdraw' do
    it { is_expected.to respond_to :withdraw }

    it 'updates statement' do
      expect(statement).to receive(:update).with(-50)
      account.withdraw(50)
    end

    it 'throws error if withdrawal amount is greater than balance' do
      expect { account.withdraw(100) }.to raise_error 'Insufficient funds'
    end
  end
end
