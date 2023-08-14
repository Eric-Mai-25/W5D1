class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = ''
    self.each_with_index do |ele, index|
      res += index.to_s + ele.ord.to_s
    end
    res.to_i
  end
end

class String
  def hash
    res = ''
    self.each_char.with_index do |ele, index|
      res += index.to_s + ele.ord.to_s
    end
    res.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    res = 0
    self.each do |key , value|
      res += key.to_s.ord + value.ord
    end
    res.to_i
  end
end