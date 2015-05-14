require_relative 'player'
require_relative 'deck'
require_relative 'card'

class Game

  def initialize
    @player_one = Player.new
    @player_two = Player.new
    @player_one.deck = Deck.new
    @player_two.deck = Deck.new
    @player_one.name = "Dealer"
    @player_two.name = "You"
  end

  def start
    puts "BLACKJACK"

    loop do
      player_one_first_card = @player_one.draw
      player_one_second_card = @player_one.draw
      player_two_first_card = @player_two.draw
      player_two_second_card = @player_two.draw

      puts "Dealer Has: #{@player_one.score}"
      puts "You Have: #{@player_two.score}"
      puts @player_one.name, player_one_first_card.display, player_one_second_card.display
      puts @player_two.name, player_two_first_card.display, player_two_second_card.display

      print "Would you like to get another card?"
      hit_me = gets.chomp
      break if @player_one.deck.count.zero?
    end
    deal_again
    announce_winner
    game_over
  end
  def deal_again (dealer_hand, your_hand)
    if hit_me=="yes"
      player_one_first_card = @player_one.draw
      player_one_second_card = @player_one.draw
      player_two_first_card = @player_two.draw
      player_two_second_card = @player_two.draw
      player_two_third_card = @player_two.draw

      puts "Dealer Has: #{@player_one.score}"
      puts "You Have: #{@player_two.score}"
      puts @player_one.name, player_one_first_card.display, player_one_second_card.display
      puts @player_two.name, player_two_first_card.display, player_two_second_card.display, player_two_third_card.display
      else
        evaluate_hand
    end
  end

  def evaluate_hand(dealers_hand, your_hand)
    dealers_hand = dealer_first_card.value + dealer_second_card.value
    your_hand = your_first_card.value + your_second_card.value + player_two_third_card.value +
    if your_hand == 21
      puts "you win"
      player_one.score += 1
    elsif your_hand > dealers_hand
      puts "You win"
      player_one.score += 1
    else
      "you lose"
      player_two.score += 1
    end
  end

  def announce_winner
    if @player_one.score >= @player_two.score
      puts "The House wins with #{@player_one.score}!!"
    else
      puts "You win with #{@player_two.score}!!"
    end
  end

  def game_over
    puts "Thanks for playing"
    print "Would you like to play again? (y/n) > "
    response = gets.chomp
    if response == 'y'
      @player_one.deck = Deck.new
      @player_two.deck = Deck.new
      @player_one.score = 0
      @player_two.score = 0
      start
    else
      exit
    end
  end
end
