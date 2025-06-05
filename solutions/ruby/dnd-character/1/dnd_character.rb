class DndCharacter
  def self.modifier(constitution) = ((constitution - 10) / 2).floor

  def initialize
    ATTRIBUTES.each do |attr|
      value = 4.times.map { (rand * 6).ceil }.sort[1..-1].sum
      define_singleton_method(attr) { value }
    end
  end

  def hitpoints = 10 + self.class.modifier(constitution)
  
  ATTRIBUTES = %w[ strength dexterity constitution intelligence wisdom charisma ]
  private_constant :ATTRIBUTES
end
