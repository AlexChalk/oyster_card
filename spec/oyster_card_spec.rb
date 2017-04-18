require 'oyster_card'

describe OysterCard do
  subject { OysterCard.new }
  alias_method :oyster_card, :subject

  it { is_expected.to respond_to :balance }

  describe '#initialize' do
    it 'initializes with a balance of 0' do
      expect(oyster_card.balance).to eq 0
    end
  end

end
