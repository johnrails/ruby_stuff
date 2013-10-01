def insertion_sort(container)
    return container if container.size < 2
    (1..container.size-1).each do |i|
      value = container[i]
      j = i-1
      while j >= 0 and container[j] > value do
        container[j+1] = container[j]
        j = j-1
      end
      container[j+1] = value
    end
    container
  end
  
 a = [100,200,200,100,100,200]
  puts a.sort
  puts insertion_sort(a)