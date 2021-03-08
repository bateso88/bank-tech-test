# frozen_string_literal: true

require_relative 'transaction'

# Statement class. Can create new transactions and print
class Statement
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def update(value, transaction_class = Transaction)
    @balance += value
    if value.negative?
      transaction_class.new(credit: nil, debit: -value, balance: balance)
    else
      transaction_class.new(credit: value, debit: nil, balance: balance)
    end
  end
end
