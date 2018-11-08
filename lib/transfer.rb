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
    sender.valid?
  end

  def execute_transaction
    if validate_bank(sender) && validate_bank(receiver)
      BankAccount.all.find {|acc|acc == sender}.balance -= amount
      BankAccount.all.find {|acc|acc == receiver}.balance+=amount
      @@all.find {|transfer|transfer == self}.status = "complete"
    else
      "One or both of the accounts are invalid"
    end
  end
end
