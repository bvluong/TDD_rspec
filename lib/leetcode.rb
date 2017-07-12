# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
    node = l1
    node2 = l2
    arr1 = []
    arr2 = []
    until node == nil && node2 == nil
        if node
            arr1.unshift(node.val)
            node = node.next
        end
        if node2
            arr2.unshift(node2.val)
            node2 = node2.next
        end
    end
    p arr1
    p arr2
    answer = arr1.join("").to_i + arr2.join("").to_i
    ans_arr = answer.to_s.reverse.split("")
    l3 = ListNode.new(ans_arr[0].to_i)
    node = l3
    ans_arr.drop(1).each do |val|
        node.next = ListNode.new(val.to_i)
        node = node.next
    end
    return l3
end


class WordChainer
  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  def run(source, target)
    @current_words, @all_seen_words = [source], { source => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
  end

  def adjacent_words(word)
    adjacent_words = []

    word.each_char.with_index do |old_letter, i|
      ('a'..'z').each do |new_letter|
        next if old_letter == new_letter

        new_word = word.dup
        new_word[i] = new_letter

        adjacent_words << new_word if dictionary.include?(new_word)
      end
    end

    adjacent_words
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        next if @all_seen_words.has_key?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
    end

    @current_words = new_current_words
  end

  def build_path(target)
    path = []
    current_word = target
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end

    path.length
  end
end





def ladder_length(begin_word, end_word, word_list)
    ans = WordChain.new(begin_word, end_word, word_list)
    return 0 if !word_list.include?(end_word)
    ans.run
end

class WordChain

  def initialize(begin_word, end_word, word_list)
    @all_seen_words = []
    @current_words = []
    @begin_word = begin_word
    @end_word = end_word
    @word_list = Set.new(word_list)
  end

  def adj_word(word)
    adj_words = []
    word.split("").each.with_index do |letter,idx|
      ("a".."z").each do |alpha|
          new_word = word.dup
          new_word[idx] = alpha
          next if @all_seen_words.keys.include?(new_word)
          if @word_list.include?(new_word)
            adj_words << new_word
            @all_seen_words[new_word] = word
          end
      end
    end
    adj_words
  end

  def run
    @current_words = [@begin_word]
    @all_seen_words = {@begin_word => nil}
    until @all_seen_words.keys.include?(@end_word) || @current_words.empty?
        explore_current_words
    end
    find_path
  end

  def explore_current_words
    new_words = []
    @current_words.each do |word|
      new_words += adj_word(word)
    end
    @current_words = new_words
  end

  def find_path
    ans_arr = []
    word = @end_word
    until word == nil
        ans_arr << word
        word = @all_seen_words[word]
    end
    return 0 if ans_arr.length < 2
    return ans_arr.length
  end

end

# def word_break(s,word_dict)
#   ans = []
#   temp_arr = []
#   word_dict.each_with_index do |word1,idx|
#     temp_str = s
#     if /\A#{word1}/.match(temp_str)
#       temp_arr = [word1]
#       temp_str = temp_str[word1.length..-1]
#     else
#       break
#     end
#     word_dict.drop(idx+1).each do |word2|
#       if temp_str.length == 0
#         ans << temp_arr
#         break
#       elsif /\A#{word2}/.match(temp_str)
#         temp_arr << word2
#         temp_str = temp_str[word2.length..-1]
#       end
#     end
#     ans << temp_arr
#   end
#   ans.map {|sen| sen.join(" ")}
#   ans
# end

def word_break(s,word_dict)

  cache = {}
  ans = word_helper(s,word_dict,cache)
  return ans.sort
end

def word_helper(s,word_dict,cache)
  return cache[s] if cache[s]
  return [] if s.length < 1
  res = []
  word_dict.each do |word|
    next unless /\A#{word}/.match(s)
    if word.length == s.length
      res.push(word)
    else
      rest = word_helper(s[word.length..-1], word_dict, cache)
      rest.each do |item|
        item = word + ' ' + item
        res.push(item)
      end
    end
  end
  cache[s] = res
  return res
end

def max_profit(prices)
  max = 0
  min_stock = +1.0/0.0
  prices.each do |price|
    min_stock = price if price < min_stock
    diff = price - min_stock
    max = diff if diff > max
  end
  max
end

# def max_profit2(prices)
#   profit = 0
#   min_stock = +1.0/0.0
#   temp_arr = [prices.first]
#   prices.drop(1).each do |price|
#     if temp_arr.length < 1
#       temp_arr.push(price)
#     elsif price < temp_arr[-1]
#       if temp_arr.length >= 2
#         profit += temp_arr[-1] - temp_arr[-2]
#         temp_arr.pop
#         temp_arr.pop
#       else
#         temp_arr.pop
#       end
#       temp_arr.push(price)
#     elsif price > temp_arr[-1]
#       temp_arr.pop if temp_arr.length > 1
#       temp_arr.push(price)
#     end
#   end
#   if temp_arr.length > 1
#     remain = temp_arr[-1] - temp_arr[-2]
#     profit += remain if remain > 0
#   end
#   profit
# end

def max_profit2(prices)
  max_profit, min_price = 0, +1.0/0.0
  profits_array = [0]*prices.length
  prices.each_with_index do |price,i|
    min_price = [price, min_price].min
    max_profit = [max_profit, price-min_price].max
    profits_array[i] = max_profit
  end
  max_profit, max_price = 0, -1.0/0.0
  reverse_max_profit = [0]*prices.length
  prices.reverse.each_with_index do |price,i|
    max_price = [price,max_price].max
    max_profit = [max_profit, max_price-price].max
    reverse_max_profit[prices.length-i-1] = max_profit
  end
  counter = 0
  max_profit = -1.0/0.0
  profits_array.each_with_index do |el,idx|
    max_profit = [max_profit,el+reverse_max_profit[idx]].max
  end
  max_profit
end
