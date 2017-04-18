require 'oyster_card'

describe OysterCard do
  subject { OysterCard.new }
  alias_method :oyster_card, :subject

  it 'has a BALANCE_LIMIT' do
    expect(OysterCard::BALANCE_LIMIT).to be_an_instance_of(Integer)
  end

  it 'has a FARE' do
    expect(OysterCard::FARE).to be_an_instance_of(Integer)
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
      expect { oyster_card.top_up(1) }.to raise_error "Error: Balance cannot exceed $#{OysterCard::BALANCE_LIMIT}"
    end
  end

  describe '#deduct' do
    it 'reduces the balance by the specified amount' do
      oyster_card.top_up(5)
      expect { oyster_card.deduct(5) }.to change { oyster_card.balance }.by -5
    end

    it 'raises error if deduction takes balance under 0' do
      oyster_card.top_up(5)
      expect { oyster_card.deduct(10) }.to raise_error "Error: Insufficient funds"
    end
  end

  context 'card is topped up' do
    before { oyster_card.top_up(OysterCard::BALANCE_LIMIT) }

    describe '#touch_in' do
      it 'raises error if card in journey' do
        oyster_card.touch_in
        expect { oyster_card.touch_in }.to raise_error "Error: Card already in journey"
      end
    end

    describe '#touch_out' do
      it 'raises error if card not in journey' do
        expect { oyster_card.touch_out }.to raise_error "Error: Card not in journey"
      end
    end

    describe '#in_journey?' do
      it 'is not truthy when card has just been initialized' do
        expect(oyster_card).to_not be_in_journey
      end

      it 'is truthy when card has been touched in' do
        oyster_card.touch_in
        expect(oyster_card).to be_in_journey
      end

      it 'is falsey when card has been touched out' do
        oyster_card.touch_in
        oyster_card.touch_out
        expect(oyster_card).to_not be_in_journey
      end
    end

  end

  context 'card is not sufficiently topped up' do

    describe '#touch_in' do
      it 'raises balance is less than FARE' do
        oyster_card.top_up(OysterCard::FARE - 1)
        expect{ oyster_card.touch_in }.to raise_error "Error: Insufficient funds"
      end
    end
  end

end
