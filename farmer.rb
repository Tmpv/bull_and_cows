require './herd'

class Farmer
  attr_accessor :name, :points, :herd

  def initialize(name)
    @name = name
    @points = 0
    @herd = Herd.new
  end

  def tries_to_rally_herd?
    puts "#{name}, guess your herd?"
    guess = gets.chomp.to_i

    if herd.rally?(guess)
      puts '============================'
      puts "Farmer #{name} has rallied the herd and scores #{herd.value} points"
      puts 'A new herd has been assigned'
      puts '============================'
      change_herd
    else
      puts '============================'
      puts "Farmer #{name} did not guess the herd."
      puts "This is the herd status: #{herd.animals?(guess)}"
      puts '============================'
      herd.value -= 1 unless herd.value.zero?
    end
  end

  def won?
    points >= 50
  end

  def winner_call
    puts '============================'
    puts "I farmer #{name} have won the bet!!!"
    puts '============================'
  end

  def to_s
    "Farmer #{name}, has #{points} points."
  end

  def change_herd
    self.points += herd.value
    @herd = Herd.new
  end
end
