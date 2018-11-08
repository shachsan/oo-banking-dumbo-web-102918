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

  def validate_bank(bank)
    bank_account = BankAccount.all.find{|acc|acc == bank}.first
    bank_account.status == "open" && bank_account.balance > 0 ? true : false
  end

  def valid?
    validate_bank(sender) && validate_bank(receiver) ? true : false
  end

  def execute_transactio
    if validate_bank(sender) && validate_bank(receiver)
      BankAccount.all.find {|acc|acc == sender}.balance -= amount
      BankAccount.all.find {|acc|acc == receiver}.balance+=amount
      @@all.find {|transfer|transfer == self}.status = "complete"
    else
      "One or both of the accounts are invalid"
    end
  end
end
