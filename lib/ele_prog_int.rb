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

def edit_distance(word1,word2)
  return word2.length if word1.empty?
  return word1.length if word2.empty?
  len1, len2 = word1.length, word2.length
  dict_arr = Array.new(len2+1) { Array.new(len1+1)}

  (0..len1).step { |num| dict_arr[0][num] = num }
  (0..len2).step { |num| dict_arr[num][0] = num }

  word2.split("").each_index do |idx2|
    word1.split("").each_index do |idx1|
      if word1[idx1] == word2[idx2]
        dict_arr[idx2+1][idx1+1] = dict_arr[idx2][idx1]
      else
        dict_arr[idx2+1][idx1+1] = [dict_arr[idx2][idx1],dict_arr[idx2][idx1+1],dict_arr[idx2+1][idx1]].min  + 1
      end
    end
  end
  p dict_arr[-1][-1]

end

def matrix_in_spiral_order(arr)
  return [] if arr.empty?
  return arr[0] if arr.length <= 1
  spir_arr = []
  spir_arr += arr.shift
  arr.each do |sub_arr|
    spir_arr << sub_arr.pop
  end
  p spir_arr
  p arr
  spir_arr += arr.pop.reverse
  rev_arr = []
  arr.each do |sub_arr|
    rev_arr << sub_arr.shift
  end
  spir_arr += rev_arr.reverse
  spir_arr + matrix_in_spiral_order(arr)
end
