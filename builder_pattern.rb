class Builder
  def produce_part_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def produce_part_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def produce_part_c
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def produce_part_d
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class BandCreator < Builder
  def initialize
    reset
  end

  def reset
    @band = DjentBand.new
  end

  def band
    band = @band
    reset
    band
  end

  def produce_part_a
    @band.add('Two guitarrists with 7 strings guitars tuned to drop F(F, A#, F, A#, D#, G, C)')
  end

  def produce_part_b
    @band.add('A bassist with a 5 stringed bass tuned to drop F(F, A#, F, A#, D#)')
  end

  def produce_part_c
    @band.add('Two vocalists, one just to sing clean parts and one for unclean vocals')
  end

  def produce_part_d
    @band.add('One drummer that is basically a machine gun')
  end
end

class DjentBand
  def initialize
    @parts = []
  end

  def add(part)
    @parts << part
  end

  def list_members
    print "Band instruments/members: #{@parts.join(', ')}"
  end
end

class Director
  attr_accessor :builder

  def initialize
    @builder = nil
  end

  def builder=(builder)
    @builder = builder
  end

  def build_minimal_viable_djent_band
    @builder.produce_part_a
    @builder.produce_part_b
    @builder.produce_part_d
  end

  def build_full_featured_djent_band
    @builder.produce_part_a
    @builder.produce_part_b
    @builder.produce_part_c
    @builder.produce_part_d
  end
end

director = Director.new
builder = BandCreator.new
director.builder = builder

puts 'Standard basic djent band: '
director.build_minimal_viable_djent_band
builder.band.list_members

puts "\n\n"

puts 'Basically every Djent band since 2018 '
director.build_full_featured_djent_band
builder.band.list_members

puts "\n\n"

# this is just for me to remember that the builder can be called without a director class
puts 'Custom Djent Band: '
builder.produce_part_a
builder.produce_part_b
builder.band.list_members