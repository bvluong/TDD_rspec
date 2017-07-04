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
