require_relative 'characters/npcs/mothra'
require_relative 'characters/character'
require_relative 'characters/pcs/paladin'
require_relative 'characters/pcs/wizard'
require_relative 'die'
require_relative 'action_selector'

puts "Hello, what's your name?"

character_name = gets.chomp.to_s

character = Characters::Character.new("Player One", 100) #creates character object from character.rb
player_two = Characters::Character.new("Player Two", 10)
mothra = Characters::Npcs::Mothra.new(350) #creates boss object named mothra from boss.rb
die = Die.new
encounter = ActionSelector.new

party = [character, player_two]

puts "An enemy approaches with #{mothra.hp}HP get ready!"

party.each do |member|
	puts "#{member.name} has #{member.hp}HP, #{character_name}."
end

while mothra.hp >=1
	encounter.print_options("Attack, Heal, or Flee?", ['attack', 'heal', 'flee'])
	action = encounter.get_input

	if action == 0
		party.each do |member|
			encounter.print_options("Where does #{member.name} strike?", ['head', 'torso', 'leg'])
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
	end

		if mothra.hp > 1 && character.hp > 1
			puts "You attack ferociously. mothra has #{mothra.hp}HP left."
			party.each do |member|
				hp = rand(13..18)
				member.damage!(hp)
				if member.hp < 1
					party.delete(member)
					puts "#{member.name} died."
				end
			end
		elsif mothra.hp < 1 && character.hp > 1
			puts "You killed mothra, #{character_name}!"
		end

		if party.empty? == true
			puts "Game over, #{character_name}."
			exit

		elsif character.hp > 1 && mothra.hp > 1
			party.each do |member|
				puts "Mothra attacks #{member.name} ferociously. #{member.name} has #{member.hp}HP left."
			end
		end

	elsif action == 1
		
		party.each do |member|
			hp = rand(13..18)
			member.damage!(hp)
				if member.hp < 1
					party.delete(member)
					puts "#{member.name} died."
				end
			member.heal!
			puts "mothra attacks ferociously. #{member.name} has #{member.hp}HP left, #{character_name}."
		end

		if party.empty? == true
			puts "Game over, #{character_name}."
			exit
		end

	elsif action == 2
		flee_value = die.roll

		if flee_value == 1
			mothra.subtract_hp(1000)
			puts "You ran away, #{character_name}. Very bold of you."
		elsif flee_value != 1
			party.each do |member|
				hp = rand(21..26)
				member.damage!(hp)
				if member.hp < 1
					party.delete(member)
					puts "#{member.name} died."
				end
				puts "you failed to escape, #{character_name}, and Mothra fucked up #{member.name}"
				puts "#{member.name} has #{member.hp}HP left."
			end
			if party.empty? == true
				puts "Game over, #{character_name}."
			end

		end

	end

end