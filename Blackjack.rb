class BlackJack

	def initialize
		# cards used in blackjack. card name : card value
		@CARDS = {"2"=> 2, "3"=> 3, "4"=> 4, "5"=> 5, "6"=> 6, "7"=> 7, "8"=> 8, "9"=> 9, "10"=> 10, "J"=> 10, "Q"=> 10, "K"=> 10, "A"=> 11}
		@all_cards = []
		shuffle_card
		@max_point = 21
		@player_bust = false
	end

	# shuffle the poker
	def shuffle_card
		@all_cards = (@CARDS.keys * 4).shuffle
	end

	def init_new(player_obj1, player_obj2)
		hit_action(player_obj1, true)
		hit_action(player_obj2, false)
		@player_bust = false
	end

	def deal
		return @all_cards.pop
	end

	def calculate_point(player_hold_cards)
		points = player_hold_cards.collect {|card| @CARDS[card]}.reduce(:+)
  	points -= 10 if player_hold_cards.include?("A") and points > @max_point
  	return points
  end

  def choice_action
		puts "========= Choice Your Action ========="
		puts "============= 1 for bit  ============="
		puts "============= 2 for stay ============="
		puts "============= 3 for exit ============="
		return gets.chomp.to_i
	end

	def show_player_point(player_obj)
		return calculate_point(player_obj.show_cards)
	end

	def show_player_status(player_obj)
		#puts "#{player_obj.show_name}\'s money is #{player_obj.show_money}."
		puts "#{player_obj.show_name}\'s cards is #{player_obj.show_cards}."
		puts "#{player_obj.show_name}\'s point is #{show_player_point(player_obj)}."
	end

	def is_bust(points)
		if points > @max_point
			return true
		else
			return false
		end
	end

	def find_key(tmp_hash, tmp_value)
		tmp_hash.each { |key, value| return key if value == tmp_value }
	end

	def winner(player_hash)
		player_hash.delete_if {|key, value| value > @max_point }
		return find_key(player_hash, player_hash.values.max)
	end

	def hit_action(player_obj, is_show)
		player_obj.hit(deal)
		if (is_show)
			show_player_status(player_obj)
		end
		return is_bust(show_player_point(player_obj))
	end

	def stay_action(player_obj)
		puts "#{player_obj.show_name} has finished this round."
	end

	def exit_action(player_obj)
		puts "Thanks for your join the game. Bye!"
		exit
	end 

end

