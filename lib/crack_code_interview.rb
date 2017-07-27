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

def getMinimumDifference(a, b)
    answer = []
    (0..a.length-1).step do |idx|
      if a[idx].length != b[idx].length
        answer << -1
      else
        answer << find_anagram(a[idx],b[idx])/2
      end
    end
    answer
end

def countX(steps)
  steps.map! {|el| el.split(" ") }
  hash = {}
  steps.each do |range|
    (1..range[0].to_i).each do |r|
      (1..range[1].to_i).each do |c|
        if hash["#{r} #{c}"]
          hash["#{r} #{c}"] += 1
        else
          hash["#{r} #{c}"] = 1
        end
      end
    end
  end
  hash.values.count(hash.values.max)
end




def reducedFractionSums(expressions)
  answer = []
  expressions.map! {|el| el.split("+") }
  expressions.each do |nest_arr|
    numer, denom = 0, 0
    nest_arr.map! {|frac| frac.split("/") }
    answer << find_frac(nest_arr.to_s)
  end
  answer
end

def find_frac(arr)
  numer1, numer2 = arr[0][0].to_i, arr[1][0].to_i
  denom1, denom2 = arr[0][1].to_i, arr[1][1].to_i
  denom = denom1*denom2
  numer = numer1*denom2 + numer2*denom1
  Rational(numer,denom)
end
