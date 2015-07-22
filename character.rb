class Character #base class for characters
	def initialize(name)
		@name = name
		@characterhealth = 100
		@characterswordmultiplier = 10
    	@characterwandmultiplier = 15
	end

	def heal
		@characterhealth += 15
	end

	  def show_current_hp
    @characterhealth
  end

  def subtract_character_hp(bosshit)
    @characterhealth = @characterhealth - bosshit
  end

end

class Paladin < Character #base class for paladins
	def initialize
		@characterhealth = 150
		@characterswordmultiplier = 15
    	@characterwandmultiplier = 5
	end

	def heal
		@health += 6
	end
end

class Wizard < Character #base class for wizards
	def initialize
		@characterhealth = 50
		@characterswordmultiplier = 1
    	@characterwandmultiplier = 25
	end

	def heal
		@health += 8
	end
end