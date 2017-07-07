def parity_of_bit(num)
  counter = 0;
  while num >= 1
    counter += num%10
    num /= 10
  end
  counter.even? ? 0 : 1
end

parity_of_bit(11101)

def even_odd(a)
  even_idx, odd_idx = 0, a.length-1
  while even_idx < odd_idx
    if a[even_idx].even?
      even_idx += 1
    else
      a[even_idx], a[odd_idx] = a[odd_idx], a[even_idx]
      odd_idx -= 1
    end
  end
  return a
end
