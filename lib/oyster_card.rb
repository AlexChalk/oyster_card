class OysterCard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise 'Error: Balance cannot exceed $90' if exceeds_limit?(amount)
    self.balance += amount
  end

  private

  attr_writer :balance

  def exceeds_limit?(top_up)
    top_up + balance > 90
  end

end
