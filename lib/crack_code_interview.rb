def rotate_array_left(array,rotations)
  length = array.length
  rotations = rotations % length
  until rotations == 0
    num = array.shift
    array.push(num)
    rotations -= 1
  end
  return array
end

def find_anagram(word1, word2)
  hash = {}
  word1.chars do |letter|
    hash[letter] ? hash[letter] += 1 : hash[letter] = 1
  end
  word2.chars do |letter|
    hash[letter] ? hash[letter] -= 1 : hash[letter] = -1
  end
  total = 0
  hash.values.each do |val|
    total += val.abs
  end
  return total
end
