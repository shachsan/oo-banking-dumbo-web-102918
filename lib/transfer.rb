class Transfer
  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end


  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount
      self.sender.balance-=amount
      self.receiver.balance+=amount
      self.status = "complete"
    else
      "One or both of the accounts are invalid"
    end
  end
end
