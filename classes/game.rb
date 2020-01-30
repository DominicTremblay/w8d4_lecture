require_relative './player'

class Game

  def initialize
    @player1 = Player.new 'Obi Wan'
    @player2 = Player.new 'General Grievious'
    @players = [@player1, @player2].shuffle
    @round = 1
  end

  def display_round
      puts "---------------"
      puts "    ROUND ##{@round}"
      puts "---------------"
  end
  
  def display_game_status
    puts
    puts "------ GAME STATUS -------"
    @players.each {|player| puts "#{player.name} HP: #{player.dead? ? 'DEAD' : player.hp}"}        
  end

  def game_over?
    @players.select{|player| player.dead?}.count > 0
  end

  def next_round
    # go to next round
      @round += 1
      sleep 1
      #rotate the array
      @players.rotate!
  end

  def run

    # define current_jedi and the ennemy_jedi

    until (game_over?) do

      current_jedi = @players.first
      ennemy_jedi = @players.last
      

      display_round
      
      # current_jedi will attack the ennemy_jedi
      current_jedi.attacks(ennemy_jedi)
     
      # Display the status of the game
      display_game_status

      next_round
    end
  end

end