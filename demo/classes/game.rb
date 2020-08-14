require_relative './player'

class Game

  # constructor
  def initialize

    # create 2 jedis
    @jedi1 = Player.new("Yoda")
    @jedi2 = Player.new("Anakin")
    @jedis = [@jedi1, @jedi2].shuffle

    # rounds
    @round = 1
  end

  def next_round
    puts
    puts "----------"
    puts " Round ##{@round}"
    puts "----------"
    puts
    # next round
    @round += 1
    @jedis.rotate!

  end

  def display_game_status

    puts
    puts "-------------"
    puts " Status "
    puts "-------------"
    puts
    @jedis.each {|jedi| puts "#{jedi.name} HP: #{jedi.dead? ? "Dead": jedi.hp}"}
    puts 

  end


  def alive_jedis
    @jedis.select {|jedi| !jedi.dead?}
  end

  def get_winner
    puts "The winner is #{alive_jedis.first.name}"
  end 

  def game_over
    alive_jedis.count == 1
  end

  # play method - main game loop

  def play

    until game_over do

      next_round


      attack_jedi = @jedis.first
      defense_jedi = @jedis.last

      attack_jedi.attacks(defense_jedi)
      
      display_game_status

      sleep 1
    
    end
    get_winner


  end


end