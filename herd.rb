require 'pry'
class Herd
  attr_accessor :members, :value

  def initialize
    @value = 10
    # @members = [Random.rand(0..9), Random.rand(0..9), Random.rand(0..9), Random.rand(0..9)]
    @members = [2, 1, 4, 7]
    # cheat
    p @members
  end

  def rally?(guess)
    members.join.to_i == guess.to_i
  end

  def animals?(guess)
    temp_members = members.clone

    # count bulls
    guess.to_s.split('').map(&:to_i).each_with_index do |element, index|
      if members[index] == element
        temp_members[index] = 'Bull'
      end
    end

    # count cows
    guess.to_s.split('').map(&:to_i).each do |element|
      if temp_members.include?(element)
        index = temp_members.index(element)
        temp_members[index] = 'Cow'
      end
    end

    cow_count = temp_members.select { |x| x == 'Cow' }.count
    bull_count = temp_members.select { |x| x == 'Bull' }.count

    "You have #{cow_count} Cows and #{bull_count} Bulls."
  end
end
