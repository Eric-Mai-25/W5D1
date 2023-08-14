class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max){false}
  end

  def insert(num)
    raise 'Out of bounds' if num > @max || num < 0
    store[num] = true
    return store[num] == num
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    @store[num] 
  end
  
  attr_accessor :store
  private


  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end
  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      self[num].push num 
      @count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    if self.count == @store.length
      # temp = Array.new(@store.length * 2) { Array.new }
      temp = ResizingIntSet(@store.length * 2)
      @store.each do |subarr|
        subarr.each do |el|
          temp.insert(el)
        end
      end   
    end
    @store = temp.store
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def inspect

  end
end