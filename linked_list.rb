class LinkedListNode
  attr_accessor :next, :value
  
  def initialize(value)
    @value = value
  end
end

class LinkedList
  attr_reader :last,:first
  
  def initialize(starting_values=[])
    starting_values.each { |a| add(a)}
  end
  
  def add(item)
    set_last_as LinkedListNode.new(item)
  end
  
  def add_at(index,what)
    add_after(at(index),what)
  end
  
  def add_after(item,what)
    what = LinkedListNode.new(what)
    what.next = item.next if item.next
    item.next = what
  end
  
  def at(index)
    i = 0
    each { |a| return a if i == index; i +=1}
  end
  
  def each(&block)
    i = first
    while i
      yield i
      i = i.next
    end
  end
  
  def each_value(&block)
    each_in_box{ |a| yield a.value}
  end
  
  protected
  
  def set_last_as(node)
    if first
      @last.next = node
      @last = node
    else
      @first = @last = node
    end
  end
end

require 'benchmark'
puts 'Adding to the end'
puts "Array"
time = Benchmark.measure do
  a = Array.new()
  (0..10000).each do |i|
    a << i
  end
end

puts time

puts "LinkedList"
time = Benchmark.measure do
  a = LinkedList.new
  (0..10000).each do |i|
    a.add i
  end
end

puts time

puts "Adding lots of items to a few indexes"

puts 'Array -- this will be slow'

a = (1..1000).to_a
time = Benchmark.measure do
  10.times do
    el = rand(1000)
    10000.times do
      a.insert(el,"hello world")
    end
  end
end

puts time

puts "LinkedList -- super fast!"
arr = (1..10000).to_a
a = LinkedList.new(arr)
puts a.at(23).next.value
time = Benchmark.measure do
  10.times do
    el = a.at(rand(1000))
    1000.times do
      a.add_after(el, "hello world")
    end
  end
end
a.add_after(a.at(a.last.value),"Hello there")
puts a.last.value
puts time