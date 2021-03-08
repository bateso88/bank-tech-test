# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:transaction) { double('transaction') }
  let(:transaction_class) { double('transaction_class', new: transaction) }

  context 'update' do
    it 'creates a new transaction after a deposit' do
      expect(transaction_class).to receive(:new).with({ balance: 100, credit: 100, debit: nil })
      statement.update(100, transaction_class)
    end

    it 'creates a new transaction after a withdrawal' do
      expect(transaction_class).to receive(:new).with({ balance: -100, credit: nil, debit: 100 })
      statement.update(-100, transaction_class)
    end

    it 'updates the balance correctly' do
      statement.update(100, transaction_class)
      expect(statement.balance).to eq 100
    end
  end

  context 'transactions' do
    it 'shows a list of all transactions' do
      statement.update(100, transaction_class)
      statement.update(-50, transaction_class)
      expect(statement.transactions.length).to eq 2
      expect(statement.transactions).to all(eq(transaction))
    end
  end
end
