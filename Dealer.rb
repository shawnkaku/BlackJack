require_relative 'Player'

class Dealer < Player
  def initialize()
    @name = "Ghost"
     @money = 9999999999
     @hold_cards = Array.new
     init
  end

  def dealer_rule(points)
    if (points > 17)
      return true
    else
      return false
    end
  end

end
