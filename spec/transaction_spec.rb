# frozen_string_literal: true

require 'transaction'

describe Transaction do
  context 'deposit' do
    let(:transaction) { Transaction.new(credit: 100, debit: nil, balance: 150, date: '29/02/2000') }

    it "the date should be today's date" do
      expect(transaction.date).to eq('29/02/2000')
    end

    it 'the credit should be the correct amount' do
      expect(transaction.credit).to eq '100.00'
    end

    it 'the debit should be the correct amount' do
      expect(transaction.debit).to be nil
    end

    it 'the balance should be the correct amount' do
      expect(transaction.balance).to eq '150.00'
    end
  end

  context 'withdrawal' do
    let(:transaction) { Transaction.new(credit: nil, debit: 100, balance: 50) }

    it 'the credit should be the correct amount' do
      expect(transaction.credit).to eq nil
    end

    it 'the debit should be the correct amount' do
      expect(transaction.debit).to eq '100.00'
    end
  end
end
