def parity_of_bit(num)
  counter = 0;
  while num >= 1
    counter += num%10
    num /= 10
  end
  p counter
  p counter.even?
end

parity_of_bit(11101)
