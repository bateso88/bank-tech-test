# frozen_string_literal: true

require_relative 'transaction'

# Statement class. Can create new transactions and print
class Statement
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def update(value, transaction_class = Transaction)
    update_balance(value)
    transaction = debit_or_credit?(value, transaction_class)
    transactions.unshift(transaction)
  end

  private

  def update_balance(value)
    @balance += value
  end

  def debit_or_credit?(value, transaction_class)
    if value.negative?
      transaction_class.new(credit: nil, debit: -value, balance: balance)
    else
      transaction_class.new(credit: value, debit: nil, balance: balance)
    end
  end
end
