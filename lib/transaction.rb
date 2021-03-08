# frozen_string_literal: true

# Transaction class. Contains details of date, debit, credit and balance
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit:, debit:, balance:, date: Time.now.strftime('%d/%m/%Y'))
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
