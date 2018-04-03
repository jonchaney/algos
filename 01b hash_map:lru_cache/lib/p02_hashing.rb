class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    val = 0
    self.each_with_index do |el, idx|
      val += (el + idx).hash
    end
    val
  end
end

class String
  def hash
    val = 0
    self.chars.each_with_index do |el, idx|
      val += (el.ord + idx).hash
    end 
    val
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    val = 0
    self.keys.each_with_index do |el, idx|
      val = (el.to_s.to_i + idx).hash
    end
    val 
  end
end