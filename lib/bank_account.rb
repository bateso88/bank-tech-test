# frozen_string_literal: true

require_relative 'statement'

# BankAccount class. Can withdraw from and deposit to a bank account
class BankAccount
  def initialize(statement_class = Statement)
    @statement = statement_class.new
  end

  def deposit(value)
    @statement.update(value)
  end

  def withdraw(value)
    raise 'Insufficient funds' if insufficient_funds?(value)

    @statement.update(-value)
  end

  private

  def insufficient_funds?(value)
    value > @statement.balance
  end
end
