# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:transaction) { double('transaction') }
  let(:transaction_class) { double('transaction_class', new: transaction) }

  context 'update' do
    it { is_expected.to respond_to :update }

    it 'creates a new transaction after a deposit' do
      expect(transaction_class).to receive(:new).with({ balance: 100, credit: 100, debit: nil })
      statement.update(100, transaction_class)
    end
  end
end
