card_number = "5541808923795240"

def check_card(card_number)
  digits = card_number.chars.map(&:to_i)

  checksum = digits.map.with_index do |num, index|
    if index.even?
      double = num * 2
      double > 9 ? double - 9 : double
    else
      num
    end
  end.sum

  checksum % 10 == 0
end

puts check_card(card_number)

class CreditCheck
  attr_reader :card_number, :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def is_valid?
    return check_card(card_number)
  end

  def last_four
    return card_number[-4, 4]
  end
end
