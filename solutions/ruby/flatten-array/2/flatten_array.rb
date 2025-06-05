module FlattenArray
  def self.flatten(input)
    # The most ideomatic answer
    input.flatten.compact

    # Without flatten or compact
    #input.reject(&:nil?).
    #      reduce([]) {|output,elem| output += elem.is_a?(Array) ? flatten(elem) : [elem] }
  end
end
