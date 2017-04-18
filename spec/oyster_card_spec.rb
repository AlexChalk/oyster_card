require 'oyster_card'

describe OysterCard do
  it 'responds to check_balance' do
    expect(subject).to respond_to :check_balance
  end
end
