require 'byebug'

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
  end

end

class LinkedList 
  include Enumerable
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    if empty?
      # point to first node
      @head.next = new_node
    end
    # assign pointers for new node
    new_node.prev = @tail.prev
    new_node.next = @tail
    # reassign pointers for the node before new node and tail
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each(&prc)
      pointer = @head
      until pointer == last
        prc.call(pointer)
        pointer = pointer.next
      end
      prc.call(pointer)
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end