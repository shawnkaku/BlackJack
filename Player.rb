class Player
  def initialize(name, money)
 		@name = name
 		@money = money
 		# Player got all cards.
		@hold_cards = Array.new
 		init
  end

  def init
  	@player_status = "RUN"
 		# Player got all cards.
		@hold_cards.clear()
		# Player's point of this round.
  end

  def change_status(status)
  	@player_status = status
  end
  # "RUN" => OK, "BST" => bust
  def get_status
    return @player_status
  end

  def hit(card)
  	@hold_cards.push(card)
  end

  def show_cards
    return @hold_cards
  end

  def show_name
    return @name
  end

  def show_status
  	return @player_status
  end

  def show_money
  	return @money
  end

end