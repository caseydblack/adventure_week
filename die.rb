class Die
  attr_accessor :number_showing

  alias_method :showing, :number_showing

  def roll
     @number_showing = 1 + rand(5)
  end

end
