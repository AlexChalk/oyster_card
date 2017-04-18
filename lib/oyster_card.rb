class OysterCard
  BALANCE_LIMIT = 90
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Error: Balance cannot exceed $#{BALANCE_LIMIT}" if exceeds_limit?(amount)
    self.balance += amount
  end

  def deduct(amount)
    raise "Error: Insufficient funds" if insufficient_funds?(amount)
    self.balance -= amount
  end

  def in_journey?
    in_journey
  end

  def touch_in
    self.in_journey = true
  end

  private

  attr_writer :balance, :in_journey

  def exceeds_limit?(top_up)
    top_up + balance > BALANCE_LIMIT
  end

  def insufficient_funds?(fare)
    balance - fare < 0
  end

end
