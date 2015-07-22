# die.rb
class Die

  def roll
     @numberShowing = 1 + rand(5)
    #rand(5) returns a random-ish number between 0-4
  end

  def showing
    return @numberShowing
  end

end