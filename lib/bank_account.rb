# frozen_string_literal: true

require_relative 'statement'

# BankAccount class. Can withdraw from and deposit to bank account
class BankAccount
  def initialize(statement_class = Statement)
    @statement = statement_class.new
  end

  def deposit(value)
    @statement.update(value)
  end
end
