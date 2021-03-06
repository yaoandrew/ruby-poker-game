class CardCreator
  require_relative 'card'
  attr_accessor :suit, :value

  def initialize(input_string)
    if input_string.length > 2
      @value = input_string[0] + input_string[1]
      @suit = input_string[2].upcase
    else
      @value = input_string[0]
      @suit = input_string[1].upcase
    end

    if @value.to_i.between?(2, 10)
      @value = @value.to_i
    end
  end

  def create_card
    Card.new(@suit, @value)
  end
end
