class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next, @next.prev = @next, @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @count == 0
  end

  def get(key)
    self.each {|node| return node.val if node.key == key}
  end

  def include?(key)
    self.each {|node| return true if node.key == key}
    false
  end

  def append(key, val)
    next_node = Node.new(key, val)
    saved = @tail.prev
    @tail.prev.next = next_node
    @tail.prev = next_node
    next_node.prev = saved
    next_node.next = @tail
    @count += 1
  end

  def update(key, value)
    self.each {|node| node.val = value if node.key == key}
  end

  def remove(key)
    self.each {|node| node.remove if node.key == key} 
  end

  def each(&prc)
    results = Array.new
    current_node = first
    until current_node == last.next
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
