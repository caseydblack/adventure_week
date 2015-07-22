#boss.rb

class Boss1
  def initialize(bosshp)
    @bosshp = bosshp
  end

  def subtract_hp(amount)
    @bosshp = @bosshp - amount
  end

  def show_current_hp
    @bosshp
  end
end