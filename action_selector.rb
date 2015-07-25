class ActionSelector
	def selector
	end

	def get_input
		action = gets.chomp.to_i
	end

	def print_options(text, actions)
		puts text
		actions.each_with_index do |action, index|
			puts "Press #{index} to #{action}"          
		end
	end
end

# action_selector.print_options("Attack, Heal, or Flee #{character_name}?", ['attack', 'heal', 'flee'])
# action_selctor.get_input

# action_selector.print_options("Where do you strike?", ['head', 'torso', 'leg'])
# action_selctor.get_input
