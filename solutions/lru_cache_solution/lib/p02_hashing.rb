class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  # added inject(0) to each_with_index give the another argument that starts at zero between the pipes
  # ever iteration that value changes to the value of the equation in the block -- (el.hash + i.hash) + intermediate_hash
  def hash
    each_with_index.inject(0) do |intermediate_hash, (el, i)|
      (el.hash + i.hash) ^ intermediate_hash
    end
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  def hash
    to_a.sort_by(&:hash).hash
  end
end
