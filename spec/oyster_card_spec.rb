require 'oyster_card'

describe OysterCard do
  subject { OysterCard.new }
  alias_method :oyster_card, :subject

  it 'has a BALANCE_LIMIT' do
    expect(OysterCard::BALANCE_LIMIT).to be_an_instance_of(Integer)
  end

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
      balance_limit = OysterCard::BALANCE_LIMIT
      oyster_card.top_up(balance_limit)
      expect { oyster_card.top_up(1) }.to raise_error {"Error: Balance cannot exceed $#{OysterCard::BALANCE_LIMIT}" }
    end
  end

  describe '#deduct' do
    it 'reduces the balance by the specified amount' do
      expect { oyster_card.deduct(5) }.to change { oyster_card.balance }.by -5
    end

    it 'raises error if deduction takes balance under 0' do
      oyster_card.top_up(5)
      expect { oyster_card.deduct(10) }.to raise_error {"Error: Insufficent funds"}
    end
  end

end
