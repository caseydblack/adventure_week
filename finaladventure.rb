#finaladventure.rb
require_relative 'character.rb'
require_relative 'boss1.rb'
require_relative 'die.rb'

puts "Hello, what's your name?"

character_name = gets.chomp.to_s

character = Character.new(character_name) #creates character object with user input from character.rb

godzilla = Boss1.new(250) #creates boss object named godzilla from boss1.rb

die = Die.new

puts "Here comes Godzilla, #{character_name}, get ready!"

while godzilla.show_current_hp >=1 && character.show_current_hp >=1
	bosshit = 10 #fills the "bosshit" local variable in character.rb
	puts "Attack, Heal, or Flee #{character_name}?"
	puts "Press 1 to attack"
	puts "Press 2 to heal"
	puts "Press 3 to flee"
	action = gets.chomp.to_i

	if action == 1 && godzilla.show_current_hp > 1
		puts "Where do you strike?"
		puts "Press 1 to strike it's head"
		puts "Press 2 to strike it's torso"
		puts "Press 3 to strike it's legs"

		amount = gets.chomp.to_i #fills the "amount" local variable in boss1.rb

		if amount == 1 
			amount = 15
			godzilla.subtract_hp(amount)
			bosshp = godzilla.show_current_hp
		elsif amount == 2
			amount = 10
			godzilla.subtract_hp(amount)
			bosshp = godzilla.show_current_hp
		elsif amount == 3
			amount = 5
			godzilla.subtract_hp(amount)
			bosshp = godzilla.show_current_hp
		end

		if godzilla.show_current_hp > 1 && character.show_current_hp > 1
			puts "You attack ferociously. Godzilla has #{bosshp} left."
			character.subtract_character_hp(bosshit)
			characterhp = character.show_current_hp
		elsif godzilla.show_current_hp < 1 && character.show_current_hp > 1
			puts "You killed Godzilla, #{character_name}!"
		end

		if character.show_current_hp < 1
			puts "You died, #{character_name}."
		elsif character.show_current_hp > 1 && godzilla.show_current_hp > 1
			puts "Godzilla attacks ferociously. You have #{characterhp} left, #{character_name}."
		end
			
	elsif action == 2 && godzilla.show_current_hp > 1
		character.subtract_character_hp(bosshit)
		character.heal
		characterhp = character.show_current_hp
		puts "Godzilla attacks ferociously. You have #{characterhp} left, #{character_name}."

	elsif action == 3 && godzilla.show_current_hp > 1
		fleevalue = die.roll

		if fleevalue == 1 
			godzilla.subtract_hp(1000)
			puts "You ran away, #{character_name}. Very bold of you."
		elsif fleevalue != 1
			bosshit = 25
			character.subtract_character_hp(bosshit)
			characterhp = character.show_current_hp
			puts "You failed to escape, #{character_name}, and Godzilla attacked ferociously."
			if character.show_current_hp < 1
				puts "You died, #{character_name}."
			elsif character.show_current_hp > 1 
				puts "You have #{characterhp} left."
			end

		end

	end

end