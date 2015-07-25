require_relative 'characters/npcs/mothra'
require_relative 'characters/character'
require_relative 'characters/pcs/paladin'
require_relative 'characters/pcs/wizard'
require_relative 'die'
require_relative 'action_selector'
require 'pry'

puts "Hello, what's your name?"

character_name = gets.chomp.to_s

character = Characters::Character.new(character_name, 100) #creates character object with user input from character.rb
mothra = Characters::Npcs::Mothra.new(250) #creates boss object named mothra from boss1.rb
die = Die.new
encounter = action_selector.new

puts "An enemy approaches with #{mothra.hp}HP, get ready!"

while mothra.hp >=1 && character.hp >=1
	hp = (1 + rand(10..15)) #fills the "hp" local variable in character.rb
	puts "Attack, Heal, or Flee #{character_name}?"
	puts "Press 1 to attack"
	puts "Press 2 to heal"
	puts "Press 3 to flee"
	action = gets.chomp.to_i

	if action == 1 && mothra.hp > 1
		puts "Where do you strike?"
		puts "Press 1 to strike it's head"
		puts "Press 2 to strike it's torso"
		puts "Press 3 to strike it's legs"

		amount = gets.chomp.to_i #fills the "amount" local variable in boss1.rb

		if amount == 1
			amount = 15
			mothra.subtract_hp(amount)
		elsif amount == 2
			amount = 10
			mothra.subtract_hp(amount)
		elsif amount == 3
			amount = 5
			mothra.subtract_hp(amount)
		end

		if mothra.hp > 1 && character.hp > 1
			boss_hp = mothra.hp
			puts "You attack ferociously. mothra has #{boss_hp}HP left."
			character.damage!(hp)
			character_hp = character.hp
		elsif mothra.hp < 1 && character.hp > 1
			puts "You killed mothra, #{character_name}!"
		end

		if character.hp < 1
			puts "You died, #{character_name}."
		elsif character.hp > 1 && mothra.hp > 1
			puts "mothra attacks ferociously. You have #{character_hp}HP left, #{character_name}."
		end

	elsif action == 2 && mothra.hp > 1
		character.damage!(hp)
		character.heal!
		character_hp = character.hp
		puts "mothra attacks ferociously. You have #{character_hp}HP left, #{character_name}."

	elsif action == 3 && mothra.hp > 1
		fleevalue = die.roll

		if fleevalue == 1
			mothra.subtract_hp(1000)
			puts "You ran away, #{character_name}. Very bold of you."
		elsif fleevalue != 1
			hp = 25
			character.damage!(hp)
			character_hp = character.hp
			puts "You failed to escape, #{character_name}, and mothra attacked ferociously."
			if character.hp < 1
				puts "You died, #{character_name}."
			elsif character.hp > 1
				puts "You have #{character_hp}HP left."
			end

		end

	end

end
