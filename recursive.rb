def range(start, finish) #(1,5)
  return [] if finish <= start
  [start] + range(start+1, finish)
end

#[1,2,3,4]

def sum(arr)
  return 0 if arr.empty?
  arr.first + sum(arr[1..-1])
end

def sum_it(arr)
  result = 0

  arr.each do |el|
    result += el
  end

  result
end

def exp_1(b,n) #b = 2, n = 4
  return 1 if n == 0
  b * exp_1(b, n-1)
end

def exp_2(b,n) #b = 2, n = 4
  return 1 if n == 0
  return b if n == 1
  if n.even?
    value = exp_2(b, n/2)
    value * value
  else
    value = exp_2(b, (n-1) / 2)
    b * value * value
  end
end

class Array
  def deep_dup
    result = []
    self.each do |el|
      if el.is_a?(Array)
        result << el.deep_dup
      else
        result << el
      end
    end
    result
  end
end

def fibonacci(n)#n = 4
  return [1,1] if n == 2
  return [1] if n == 1
  return [] if n <= 0

  subarray = fibonacci(n-1) # [1, 1, 2]
  subarray.concat([subarray[-2] + subarray[-1]])
end

def subsets(arr) # [1,2,3]
  return [[]] if arr.empty?
  value = subsets(arr[0...-1])
  new_arr = value.map do |sub_arr|
    sub_arr + [arr.last]
  end
  value + new_arr
end

def permutations(arr)
  return [arr] if arr.length <= 1
  result = []
  value = permutations(arr[0...-1])

  value.each do |sub|
    arr.length.times do |i|
      result << sub[0...i] + [arr.last] + sub[i..-1]
    end
  end

  result
end


# def bsearch(arr,target)
#   return nil if arr.empty?
#   mid_idx = arr.length / 2
#
#   case target <=> arr[mid_idx]
#   when -1
#     bsearch(arr.take(mid_idx), target)
#   when 0
#     return mid_idx
#   when 1
#     secondhalf = bsearch(arr.drop(mid_idx + 1), target)
#     (secondhalf.nil?) ? nil : (mid_idx + 1) + secondhalf
#    end
# end

def bsearch(arr, target) #[1,2,3,4]
  return nil if arr.empty?
  mid_idx = arr.length / 2

  if target < arr[mid_idx]
    firsthalf = arr[0...mid_idx]
    bsearch(firsthalf, target)
  elsif target > arr[mid_idx]
    secondhalf = arr[mid_idx + 1..-1]
    last_idx = bsearch(secondhalf, target)

    last_idx.nil? ? nil : (mid_idx + 1) + last_idx
  else
    mid_idx
  end
end
