# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  context 'update' do
    it { is_expected.to respond_to :update }
  end
end
