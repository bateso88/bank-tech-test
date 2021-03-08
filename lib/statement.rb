# frozen_string_literal: true

# BankAccount class. Can withdraw from and deposit to bank account
class Statement
  def update(value, transaction_class = Transaction)
    transaction_class.new(value)
  end
end
