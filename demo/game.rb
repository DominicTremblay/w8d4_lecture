require_relative './player'

class Game

  # constructor
  def initialize
    @player1 = Player.new("Princess Donuts Head")
    @player2 = Player.new("Obi Wan")
    @players=[@player1, @player2].shuffle
    @round=1
  end


  def next_round
    
    puts "------------------------"
    puts " \t Round #: #{@round}"
    puts "------------------------"
  
    @players.rotate!

    puts @players.inspect

    @round += 1

  end

  def display_status
    puts " --------------------- "
    puts "\t Game Status"
    puts " --------------------- "

    @players.each{|player| puts "#{player.name} HP: #{player.dead? ? 'DEAD' : player.hp}"}

    sleep 1
  end

  def winner
    # player who is not dead
    winner = @players.find{|player| !player.dead? }
    puts "The winner is #{winner.name}"
  end

  def game_over?
    @players.select{|player| player.dead?}.count > 0
  end

  def play
    
    until (game_over?) do
      attack_jedi = @players.first
      defend_jedi = @players.last
      next_round
      attack_jedi.attacks(defend_jedi)
      display_status
    end

    winner
  end

end