card_number = "5541808923795240"

def check_card(card_number)

  card_number_array = card_number.split("").map(&:to_i)
  card_number_array_sum = 0
  card_number_array.each_with_index do |num, index| 
    if index % 2 == 0
      card_number_array[index] = num * 2
      if card_number_array[index] > 9
        card_number_array[index] = card_number_array[index].to_s.split("").map { |num| num.to_i }.sum
      end
    end
    card_number_array_sum += card_number_array[index]
  end
  if (card_number_array_sum % 10) == 0
    return true
  else
    return false
  end
end

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
    return card_number[card_number.length - 4, 4]
  end
end
