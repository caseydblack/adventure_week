#finaladventure.rb
require_relative 'character.rb'
require_relative 'boss1.rb'

puts "Hello, what's your name?"

character_name = gets.chomp.to_s

character = Character.new(character_name) #creates character object with user input from character.rb

godzilla = Boss1.new(250) #creates boss object named godzilla from boss1.rb

puts "Here comes Godzilla, #{character_name}, get ready!"

while godzilla.show_current_hp >=1 #starts the boss encounter.
	bosshit = 10 #fills the "bosshit" local variable in character.rb
	puts "How many times do you attack?"
	amount = gets.chomp.to_i #fills the "amount" local variable in boss1.rb
		godzilla.subtract_hp(amount)
		bosshp = godzilla.show_current_hp
	unless godzilla.show_current_hp < 1
		puts "Godzilla has #{bosshp} left."
	end
	if godzilla.show_current_hp > 1
		character.subtract_character_hp(bosshit)
		characterhp = character.show_current_hp
		puts "Godzilla attacks ferociously. You have #{characterhp} left, #{character_name}."
	elsif godzilla.show_current_hp < 1
		puts "You killed Godzilla, #{character_name}!"
	end
end