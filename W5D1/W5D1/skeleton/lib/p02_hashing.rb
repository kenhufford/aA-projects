class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |int, i| 
      sum += (i+1) * int.hash
    end
    sum
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    dup = self.chars
    sum = 0
    dup.each_with_index do |char, i|
      sum += (i+1) * (alpha.index(char.downcase) + 1).hash
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |key, val|
      sum += key.hash + val.hash
    end
    sum
  end
end
