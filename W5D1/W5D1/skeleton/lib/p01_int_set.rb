class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end

  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

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
    idx = num % @store.length
    @store[idx] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
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
    idx = num % @store.length
    if !include?(num)
      @count += 1
      @store[idx] << num 
    end
 
    if @count >= @store.length
      resize!
    end
  end

  def remove(num)
    @count -=1 if self[num].delete(num) 
  end

  def include?(num)
    idx = num % @store.length
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dup = @store.dup
    @store = Array.new(@store.length * 2){Array.new}
    @count = 0
    dup.each do |array|
      array.each do |ele|
        insert(ele)
      end
    end
  end
end
