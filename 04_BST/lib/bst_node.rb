class BSTNode
  attr_reader :value
  attr_accessor :left, :right
  def initialize(value)
    @value = value 
    # @color = color
    @left = nil
    @right = nil 
  end
end