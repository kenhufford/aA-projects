class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # p key.to_s.hash % num_buckets
    self[key] << key 
    @count += 1
    if @count >= num_buckets
      resize!
    end
  end

  def include?(key)
    # p @store
    # p key.to_s.hash % num_buckets
    # p @store[key.to_s.hash % num_buckets]
    self[key].include?(key)

  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dup = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    dup.each do |ele|
      insert(ele)
    end
  end


end
