class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self[key].include?(key)
      self[key].push key
      @count += 1
    end

    if @count == @store.length
      resize!
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    # temp = Array.new(@store.length * 2) { Array.new }
    temp = HashSet.new(@store.length * 2)
    @store.each do |subarr|
      subarr.each do |el|
        temp.insert(el)
      end
    end   
    @store = temp.store
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end
end