# frozen_string_literal: true

require 'statement'

describe Statement do
  create_statment_instance_and_doubles_for_transaction_class_and_transaction

  context 'update' do
    it 'creates a new transaction after a deposit and updates balance correctly' do
      expect(transaction_class).to receive(:new).with({ balance: 100, credit: 100, debit: nil })
      statement.update(100, transaction_class)
      expect(statement.balance).to eq 100
    end
    it 'creates a new transaction after a withdrawal' do
      expect(transaction_class).to receive(:new).with({ balance: -100, credit: nil, debit: 100 })
      statement.update(-100, transaction_class)
    end
  end
  context 'transactions' do
    it 'returns a list of all transactions. View puts all transactions.' do
      statement.update(100, transaction_class)
      statement.update(-50, transaction_class)
      expect(statement.transactions.length).to eq 2
      expect(statement.transactions).to all(eq(transaction))
    end
    it 'statement.view prints all transactions nicely' do
      statement.update(-50, transaction_class)
      expect($stdout).to receive(:puts).twice
      statement.view
    end
  end
end
