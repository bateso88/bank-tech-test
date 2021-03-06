# frozen_string_literal: true

# Transaction class. Contains details of date, debit, credit and balance
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit:, debit:, balance:, date: Time.now.strftime('%d/%m/%Y'))
    @date = date
    @credit = credit.nil? ? nil : format('%0.2f', credit)
    @debit = debit.nil? ? nil : format('%.2f', debit)
    @balance = balance.nil? ? nil : format('%.2f', balance)
  end
end
