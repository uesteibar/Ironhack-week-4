# Write a method that takes in two numbers.
# Return the greatest integer that evenly divides both numbers.

require "pry"

def greatest_common_factor(number1, number2)
  greatest = 1
  min_num = [number1, number2].min
  (1...min_num + 1).each do |num|
    if (number1 % num == 0) && (number2 % num == 0)
      greatest = num
    end
  end

  greatest
end

puts(
  'greatest_common_factor(3, 9) == 3: ' +
  (greatest_common_factor(3, 9) == 3).to_s
)
puts(
  'greatest_common_factor(16, 24) == 8: ' +
  (greatest_common_factor(16, 24) == 8).to_s
)
puts(
  'greatest_common_factor(3, 5) == 1: ' +
  (greatest_common_factor(3, 5) == 1).to_s
)
