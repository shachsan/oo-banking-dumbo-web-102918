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
    if valid? && sender.balance > amount && self.status == "pending"
      self.sender.balance-=amount
      self.receiver.balance+=amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      
    end
  end

  def reverse_transfer
    if self.status == 'complete'
    self.sender.balance+=amount
    self.receiver.balance-=amount
    self.status = "reversed"
  end
  end
end
