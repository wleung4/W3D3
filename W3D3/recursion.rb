def rec_range(start, ending)
	return [] if start > ending
	return [] if start == ending

	arr = []
	next_num = rec_range(start + 1, ending)
	arr += [start] + next_num
	arr
end

def iter_range(start, ending)
	(start...ending).map {|ele| ele}
end

def exponent_1(base, n)
	return 1 if n == 0

	return base * exponent_1(base, n - 1)
end

def exponent_2(base, n)
	return 1 if n == 0
	return base if n == 1

	return exponent_2(base, n / 2) * exponent_2(base, n / 2)  if n.even?
	return base * (exponent_2(base, (n - 1) / 2) * exponent_2(base, (n - 1) / 2)) if n.odd?
end

class Array
	def deep_dup
		return [] if self.length == 0

		copy = []
		self.each do |ele|
			if ele.is_a? Array
				copy += ele
			else
				copy += [ele]
			end
		end
		copy
	end
end

def rec_fibonnaci(n) # 1, 1, 2, 3, 5, 8, 13, 21
	return 1 if n == 0
	return 1 if n == 1

	rec_fibonnaci(n - 2) + rec_fibonnaci(n - 1)
end

def rec_fibonnaci_array(n)
	return [1] if n == 0
	return [1, 1] if n == 1
			
	result = []
	sum_arr = rec_fibonnaci_array(n - 2) + rec_fibonnaci_array(n - 1)
	result << sum_arr.sum 
	result
end

def iter_fibonnaci(n)
	fib = [1, 1]
	return [1] if n == 0
	(2..n).each do |ele|
		fib << fib[-2] + fib[-1]
	end
	fib
end

# p rec_fibonnaci_array(0)
# p rec_fibonnaci_array(1)
# p rec_fibonnaci_array(2)
# p rec_fibonnaci_array(3)
# p rec_fibonnaci_array(4)
# p rec_fibonnaci_array(5)

def bsearch(array, target)
	# compare target to middle element value
	# if target value == middle value
	# index is return and finished
	# if target value < middle value search lower half of array
	# if target value > middle value search upper half of array

	return nil if !array.include?(target) #need to check if target is included 

	mid = array.length / 2
	left = array[0...mid]
	right = array[mid + 1..-1]

	if target == array[mid]
		return mid 
	elsif target < array[mid] 
		bsearch(left, target)
	else # target > array[mid]  # need to track index 
		mid + 1 + bsearch(right, target) # mid + 1 is the index of first mid, add to result of bsearch
	end
end

def merge_sort(array)
	# split array into halves until each arr is one length (base case)
	# compare each 2 arr and join into 1 arr
	# repeat until completely merged and sorted
	return [] if array.empty?
	return array if array.length == 1

	mid = array.length / 2
	left = array[0...mid]
	right = array[mid..-1]

	# arr = [left, right] # left and right halves
	left_merge = merge_sort(left)
	right_merge = merge_sort(right)
	merge(left_merge, right_merge) #merge halves
end

def merge(arr_1, arr_2)
	combined = arr_1 + arr_2
	length = combined.length

	results = []
	(0...combined.length).each do |idx|
		results << combined.min
		combined.delete_at(combined.index(combined.min))
	end
	results
	"""Flextime solution
		sorted = []
		while !(arr_1.empty? || arr_2.empty?)
			arr_1[0] >= arr_2[0] ? sorted << arr.shift : sorted arr_1.shift
		end
		sorted + arr_1 + arr_2
	"""
end
p merge_sort([38, 27, 43, 3, 9, 82, 10])


