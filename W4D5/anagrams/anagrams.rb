require "byebug"
def first_anagram?(str, target)

  chars = str.split("")
  
  permutation(chars).map { |ele| ele.join("") }.include?(target)

end

def permutation(arr)
  return [arr] if arr.length < 2

  first = arr.shift
  previous_lvl = permutation(arr)
  permu = []
  previous_lvl.each do |ele|
    (0..ele.length).to_a.each do |i|
      permu << ele[0...i] + [first] + ele[i..-1]
    end
  end
  permu
 
end

# p first_anagram?('cat', 'bob')
# # p permutation(['c','a', 't'])

def second_anagram?(str, target)
  # debugger
  str.each_char do |char|
    target_idx = target.index(char)   
    target[target_idx] = "" if target_idx != nil
  end

  target.length == 0
end

# p second_anagram?('cat', 'bob')
# p second_anagram?('cat', 'act')

def third_anagram?(str, target)
  str.split("").sort == target.split("").sort
end

# p third_anagram?('cat', 'bob')
# p third_anagram?('cat', 'act')

def fourth_anagram?(str, target)
  hash = Hash.new(0)
  str.each_char{|char| hash[char] += 1}
  target.each_char{|char| hash[char] -=1}
  hash.values.all?(0)

end

p fourth_anagram?('cat', 'bob')
p fourth_anagram?('cat', 'act')