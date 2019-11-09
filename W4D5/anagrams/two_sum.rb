def bad_two_sum?(arr, target)
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      if j > i
        return true if arr[j] + arr[i] == target
      end
    end
  end
  return false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)
  arr.each do |ele|
    return true if arr.include?(target - ele)
  end
  false
end

def quick_sort(arr)
  
  return arr if length < 2
  pivot = arr.shift
  left = []
  right = []

  arr.each do |ele|
    pivot > ele ? left << ele : right << ele
  end

  quick_sort(left) + [pivot] + quick_sort(right)
  
end