require 'rspec'
require './lib/bank'
require './lib/credit_check'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Bank do
  it "exists" do
    bank = Bank.new("Wells Fargo")
    expect(bank).to be_a Bank
  end

  it "has a name" do 
    bank = Bank.new("Wells Fargo")
    expect(bank.name).to eq "Wells Fargo"
  end

  it "knows a transaction is invalid when credit card is invalid" do
    bank = Bank.new("Wells Fargo")
    credit_check = CreditCheck.new("4034007106512380", 15000)
    expect(bank.valid_transaction?(100, credit_check)).to be false
  end

  it "knows a transactions is invalid when the amount is over the limit" do
    bank = Bank.new("Wells Fargo")
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(bank.valid_transaction?(20000, credit_check)).to be false
  end

  it "knows when a transaction is valid" do
    bank = Bank.new("Wells Fargo")
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(bank.valid_transaction?(11000, credit_check)).to be true
  end
end

RSpec.describe CreditCheck do
  it "exists" do
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(credit_check).to be_a CreditCheck
  end

  it "has a card number" do
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(credit_check.card_number).to eq "5541808923795240"
  end

  it "has a limit" do
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(credit_check.limit).to eq 15000
  end

  it "knows if a card is valid" do
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(credit_check.is_valid?).to be true
  end

  it "knows if a card is invalid" do
    credit_check = CreditCheck.new("5541801923795240", 15000)
    expect(credit_check.is_valid?).to be false
  end

  it "returns the last four digits of the card number" do
    credit_check = CreditCheck.new("5541808923795240", 15000)
    expect(credit_check.last_four).to eq "5240"
  end
end