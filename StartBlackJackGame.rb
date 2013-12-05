require_relative 'BlackJack'
require_relative 'Player'
require_relative 'Dealer'



puts "============= Strat the BlackJack Game ============="
puts "Welcome to the BlackJack game. What's your name?"
player1_name = gets.chomp
player1_money = 100
player1 = Player.new(player1_name, player1_money)
dealer = Dealer.new()
BJ = BlackJack.new()
player_h = Hash.new
puts "Hi~ #{player1.show_name}!"
puts "The dealer name is #{dealer.show_name}!"
#puts "Hi~ #{player1.show_name}! At the begining, your money is #{player1.show_money}."
#puts "The dealer name is #{dealer.show_name}! His money is #{dealer.show_money}."

choice = 1
BJ.init_new(player1, dealer)

while choice != 3
	puts "Status: #{player1.get_status}"
	if player1.get_status == "BST"
		choice = 2
	else
		choice = BJ.choice_action
	end
	case 
		when choice == 1
  		if BJ.hit_action(player1, true)
  			player1.change_status("BST")
  		end
  	when choice == 2
    	BJ.stay_action(player1)
    	# turn to dealer to do something
    	loop do BJ.hit_action(dealer, true)
    		break if (dealer.dealer_rule(BJ.show_player_point(dealer)) == true)
    	end
    	# and compare which one is the winner in this round
    	player_h = {player1.show_name => BJ.show_player_point(player1), dealer.show_name => BJ.show_player_point(dealer)}
    	puts "This round winner is #{BJ.winner(player_h)}."
    	player1.init()
    	dealer.init()
    	puts "------------#{player_h}"
    	BJ.init_new(player1, dealer)
  	when choice == 3
    	BJ.exit_action(player1)
  	else
    	puts "You didn't Enter any choice. Please Enter 1, 2, or 3."
  	end
end

player_h = {player1 => BJ.show_player_point(player1), dealer => BJ.show_player_point(dealer)}
#puts "#{player1.show_name}, you got \"#{player1.show_cards}\". "
#puts "Your point is #{BJ.calculate_point(player1.show_cards)}. "



