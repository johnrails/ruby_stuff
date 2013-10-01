NUM_STUDENTS = 300
MAX_GRADE = 100
arr = Array.new(NUM_STUDENTS)
value_to_find = 7
low = 0
high = NUM_STUDENTS - 1
middle = (low + high) / 2
found = false
students_arr = (0..NUM_STUDENTS).to_a
# put values in Array
students_arr.each do |i|
	new_value = rand(MAX_GRADE + 1)	
	while arr.include?(new_value)
		new_value = rand(MAX_GRADE + 1)
	end
	arr[i] = new_value
end

# sort the Array
arr.sort!

puts "Input List: "
students_arr.each do	|i|
	puts "arr[" + i.to_s + "] ==> " + arr[i].to_s
end
while low <= high && !found
	middle = (low + high) / 2
	#we found it
	if arr[middle] == value_to_find
		puts "Found grade " + value_to_find.to_s + "% at position " + middle.to_s
		found = true
	end
	if arr[middle] < value_to_find
		low = middle + 1
	else
		high = middle - 1
	end
end

unless found
	puts "There is no grade of " + value_to_find.to_s + "% in the list."
end