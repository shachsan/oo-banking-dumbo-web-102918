class Transfer
  attr_accessor :amount
  attr_reader :sender, :receiver, :status

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
      
    else
      "One or both of the accounts are invalid"
    end
  end
end
