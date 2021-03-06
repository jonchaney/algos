require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @store.length == @count
    if @store[key.hash % num_buckets].include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else 
      @count += 1
      bucket(key).append(key, val)
    end 
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    @count -= 1
    bucket(key).remove(key)
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield [node.key, node.val]
      end 
    end 
  end
  
  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets*2) { LinkedList.new }
    @store.each do |list|
      list.each do |node|
        new_store[node.key.hash % (num_buckets*2)].append(node.key, node.val)
      end 
    end 
    @store = new_store
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end 
end