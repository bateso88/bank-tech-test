# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  context 'deposit' do
    it { is_expected.to respond_to :deposit }
  end
end
