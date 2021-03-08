# frozen_string_literal: true

require_relative 'transaction'

# Statement class. Can create new transactions and be viewed
class Statement
  attr_reader :transactions, :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def update(value, transaction_class = Transaction)
    update_balance(value)
    transaction = debit_or_credit?(value, transaction_class)
    transactions.unshift(transaction)
  end

  def view
    puts 'date || credit || debit || balance'
    transactions.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
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
