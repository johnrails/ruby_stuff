def reverse(arr)
    leng = arr.size
    mid = arr.size/2
    (0..mid).to_a.each do |i|
        arr[i],arr[leng - 1 - i] = arr[leng - 1 - i],arr[i]
    end
    puts arr.join
end
a = [1,2,3,4,5,6]
reverse(a)