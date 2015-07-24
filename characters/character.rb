module Characters
  class Character
    attr_accessor :name, :hp, :sword_multiplier, :wand_multiplier

    MAX_HEALTH = 100
    SWORD_MULTIPLIER = 10
    WAND_MULTIPLIER = 15

  	def initialize(name)
  		@name = name
      @hp = HEALTH
  	end

  	def heal!
  		@hp += (1 + rand(15..20))
  	end

    def damage!(hp)
      @hp -= hp
    end

  end
end
