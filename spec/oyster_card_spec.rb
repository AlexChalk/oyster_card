require 'oyster_card'

describe OysterCard do
  subject { OysterCard.new }
  alias_method :oyster_card, :subject

  it { is_expected.to respond_to :balance }

end
