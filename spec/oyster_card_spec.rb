require 'oyster_card'

describe OysterCard do
  subject { OysterCard.new }
  alias_method :oyster_card, :subject

  describe '#initialize' do
    it 'initializes with a balance of 0' do
      expect(oyster_card.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'increases the balance by the specified amount' do
      oyster_card.top_up(5)
      expect(oyster_card.balance).to eq 5
    end
  end

end
