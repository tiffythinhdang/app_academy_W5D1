class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_arr = self.map(&:to_s)
    nums = new_arr.map.with_index do |el, idx| 
      chars = el.chars
      chars = chars.map.with_index { |char, i| char.ord * 31 ** i }
      chars.inject(:+)
    end 
    nums = nums.map.with_index { |num, i| num ** i }
    nums.sum
  end
end

class String
  def hash
    chars = self.chars
    nums = chars.map.with_index { |char, idx| char.ord * 31 ** idx }
    nums.inject(:+)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
