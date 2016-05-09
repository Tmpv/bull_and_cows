require './farmer'

puts "Let`s play a little fun game"

puts 'Tell me, what is the first farmer`s name'
first_farmer_name = gets.chomp

puts 'Tell me, what is the second farmer`s name'
second_farmer_name = gets.chomp

farmer_one = Farmer.new(first_farmer_name)
farmer_two = Farmer.new(second_farmer_name)

loop do
  farmer_one.tries_to_rally_herd?
  farmer_two.tries_to_rally_herd?

  if farmer_one.won?
    puts "FARMER #{farmer_one.name} WON THE BET."
    break
  end

  if farmer_two.won?
    purs "FARMER #{farmer_two.name} WON THE BET."
    break
  end

  puts farmer_one.to_s
  puts farmer_two.to_s
  puts "============================\n"
end
