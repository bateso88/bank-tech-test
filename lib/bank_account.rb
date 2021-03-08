# frozen_string_literal: true

require_relative 'statement'

# BankAccount class. Can withdraw from and deposit to a bank account
class BankAccount
  attr_reader :statement

  def initialize(statement_class = Statement)
    @statement = statement_class.new
  end

  def deposit(value)
    raise 'Amount must be positive' if value.negative?

    @statement.update(value)
  end

  def withdraw(value)
    raise 'Insufficient funds' if balance_less_than?(value)

    raise 'Amount must be positive' if value.negative?

    @statement.update(-value)
  end

  private

  def balance_less_than?(value)
    value > @statement.balance
  end
end
