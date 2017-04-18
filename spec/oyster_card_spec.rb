require 'oyster_card'

describe OysterCard do
  subject { OysterCard.new }
  alias_method :oyster_card, :subject

  describe '#balance' do
    it 'is set to 0 at initialization' do
      expect(oyster_card.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'increases the balance by the specified amount' do
      expect { oyster_card.top_up(5) }.to change { oyster_card.balance }.by 5
    end

    it 'raises error if top-up would take balance over 90' do
      expect { oyster_card.top_up(100) }.to raise_error {"Error: Balance cannot exceed $90" }
    end 
  end

end
