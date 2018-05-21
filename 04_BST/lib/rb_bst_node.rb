class BSTNodeRB
    attr_reader :value
    attr_accessor :left, :right
    def initialize(value, color)
      @value = value 
      @color = color
      @left = nil
      @right = nil 
    end
  end