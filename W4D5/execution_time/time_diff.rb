require "byebug"


def my_min(list)

  smallest = 0

  list.each {|ele| smallest = ele if ele < smallest}

  smallest

end



# def largest(list)
#   subs = []
#   (0...list.length).each do |i|
#     subs << [list[i]]
#     (0...list.length).each do |j|
#       if j > i
#         subs << list[i..j]
#       end
#     end
#   end
#   subs

#   greatest = subs.first.sum
#   subs.each do |sub|
#     max = sub.sum if sub.sum > max
#   end
#   max
# end






# def largest(list)
#   max = list.first
#   (0...list.length).each do |i|
#     max = list[i] if list[i] > max
#     (0...list.length).each do |j|
#       max = list[i..j].sum if j > i && list[i..j].sum > max
#     end
#   end
#   max

# end

# p largest(list)

list = [-1, 2, 3, -7, 8, -9]

def largest(list)
  return list.max if list.sum < 0
  greatest = 0
  sum = 0
  (0...list.length).each do |i|
    sum += list[i]
    if sum > greatest
      greatest = sum
    elsif sum > 0
      next
    else
      sum = 0
    end
  end
  greatest
end

p largest(list)