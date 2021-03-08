# frozen_string_literal: true

require 'transaction'

describe Transaction do
  context 'deposit' do
    let(:transaction) { Transaction.new(credit: 100, debit: nil, balance: 150) }

    it "the date should be today's date" do
      expect(transaction.date).to eq(Time.now.strftime('%d/%m/%Y'))
    end

    it 'the credit should be the correct amount' do
      expect(transaction.credit).to eq 100
    end

    it 'the debit should be the correct amount' do
      expect(transaction.debit).to be nil
    end

    it 'the balance should be the correct amount' do
      expect(transaction.balance).to eq 150
    end
  end

  context 'withdrawal' do
    let(:transaction) { Transaction.new(credit: nil, debit: 100, balance: 50) }

    it 'the credit should be the correct amount' do
      expect(transaction.credit).to eq nil
    end

    it 'the debit should be the correct amount' do
      expect(transaction.debit).to be 100
    end
  end
end
