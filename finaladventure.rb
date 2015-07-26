require_relative 'characters/npcs/mothra'
require_relative 'characters/character'
require_relative 'characters/pcs/paladin'
require_relative 'characters/pcs/wizard'
require_relative 'die'
require_relative 'action_selector'

puts "Hello, what's your name?"

character_name = gets.chomp.to_s

character = Characters::Character.new(character_name, 100) #creates character object with user input from character.rb
mothra = Characters::Npcs::Mothra.new(125) #creates boss object named mothra from boss1.rb
die = Die.new
encounter = ActionSelector.new

puts "An enemy approaches with #{mothra.hp}HP get ready!"
puts "You have #{character.hp}HP, #{character_name}."

while mothra.hp >=1 && character.hp >=1
	hp = rand(13..18) #fills the "hp" local variable in character.rb
	encounter.print_options("Attack, Heal, or Flee #{character_name}?", ['attack', 'heal', 'flee'])
	action = encounter.get_input

	if action == 0
	encounter.print_options("Where do you strike?", ['head', 'torso', 'leg'])
	amount = encounter.get_input

		if amount == 0
			amount = rand(16..21)
			mothra.subtract_hp(amount)
		elsif amount == 1
			amount = rand(11..16)
			mothra.subtract_hp(amount)
		elsif amount == 2
			amount = rand(6..11)
			mothra.subtract_hp(amount)
		end

		if mothra.hp > 1 && character.hp > 1
			puts "You attack ferociously. mothra has #{mothra.hp}HP left."
			character.damage!(hp)
		elsif mothra.hp < 1 && character.hp > 1
			puts "You killed mothra, #{character_name}!"
		end

		if character.hp < 1
			puts "You died, #{character_name}."
		elsif character.hp > 1 && mothra.hp > 1
			puts "mothra attacks ferociously. You have #{character.hp}HP left, #{character_name}."
		end

	elsif action == 1
		character.damage!(hp)
		character.heal!
		puts "mothra attacks ferociously. You have #{character.hp}HP left, #{character_name}."

	elsif action == 2
		flee_value = die.roll

		if flee_value == 1
			mothra.subtract_hp(1000)
			puts "You ran away, #{character_name}. Very bold of you."
		elsif flee_value != 1
			hp = rand(21..26)
			character.damage!(hp)
			puts "You failed to escape, #{character_name}, and mothra attacked ferociously."
			if character.hp < 1
				puts "You died, #{character_name}."
			elsif character.hp > 1
				puts "You have #{character.hp}HP left."
			end

		end

	end

end