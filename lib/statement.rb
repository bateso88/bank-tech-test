# frozen_string_literal: true

require_relative 'transaction'

# Statement class. Can create new transactions and print
class Statement
  def update(value, transaction_class = Transaction)
    transaction_class.new(credit: value, debit: nil, balance: value)
  end
end
