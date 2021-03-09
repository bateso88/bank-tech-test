# frozen_string_literal: true

def create_statment_instance_and_doubles_for_transaction_class_and_transaction
  let(:statement) { Statement.new }
  let(:transaction) do
    double('transaction', date: 1, credit: 2, debit: 3,
                          balance: 4)
  end
  let(:transaction_class) { double('transaction_class', new: transaction) }
end

def create_bank_account_instance_and_doubles_for_statement_class_and_statement
  let(:statement) { double('statement', update: true, balance: 50) }
  let(:statement_class) { double('statement_class', new: statement) }
  let(:account) { BankAccount.new(statement_class) }
end
