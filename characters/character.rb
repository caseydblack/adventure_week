module Characters
  class Character
    attr_accessor :name, :hp, :sword_multiplier, :wand_multiplier

    MAX_HEALTH = 100
    SWORD_MULTIPLIER = 10
    WAND_MULTIPLIER = 15

  	def initialize(name, hp)
  		@name = name
      @hp = hp
      @heal_attempts = 0
  	end

  	def heal!
      return puts 'Too many heal attempts' if @heal_attempts == 5
      @heal_attempts += 1
  		@hp += rand(16..21)
  	end

    def damage!(hp)
      @hp -= hp
    end

  end
end
