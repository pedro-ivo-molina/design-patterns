class Djent
end

class Deathcore
end

class Festival
  attr_accessor :bands

  def initialize(number, style)
    @bands = []
    number.times { bands << create(style) }
  end
end

class BandFactory < Festival
  def create(style)
    if [:djent, :deathcore].include?(style)
      self.class.const_get(style.to_s.capitalize).new
    else
      raise 'This is genre is so bad that this festival will not allow it'
    end
  end
end

festival = BandFactory.new(10, :djent)
festival2 = BandFactory.new(10, :deathcore)

p "The first festival is a Djent festival and the second is a deathcore festival"