require 'rspec'
require 'leetcode'

describe "word_break" do
  it "construct a sentence where each word is a valid dictionary word" do
    result1 = word_break("catsanddog", ["cat", "cats", "and", "sand", "dog"])
    result2 = word_break("aaaaaaa", ["aaaa","aa","a"])
    expect(result1).to eq(["cats and dog", "cat sand dog"].sort)
    expect(result2).to eq(["a a a a a a a","aa a a a a a","a aa a a a a","a a aa a a a","aa aa a a a","aaaa a a a","a a a aa a a","aa a aa a a","a aa aa a a",
      "a aaaa a a","a a a a aa a","aa a a aa a","a aa a aa a","a a aa aa a","aa aa aa a","aaaa aa a",
      "a a aaaa a","aa aaaa a","a a a a a aa","aa a a a aa","a aa a a aa","a a aa a aa","aa aa a aa",
      "aaaa a aa","a a a aa aa","aa a aa aa","a aa aa aa","a aaaa aa","a a a aaaa","aa a aaaa","a aa aaaa"].sort)
  end
end

describe "max_profit" do
  it "return maximum value for buying and selling stock - 1 transaction" do
    result1 = max_profit([7, 1, 5, 3, 6, 4])
    result2 = max_profit([2,1,2,0,1])
    expect(result1).to eq(5)
    expect(result2).to eq(1)
    end
end

describe "max_profit2" do
  it "return maximum value for buying and selling stock - unlimited transaction" do
    result1 = max_profit([7, 1, 5, 3, 6, 4])
    result2 = max_profit([2,1,2,0,1])
    expect(result1).to eq(5)
    expect(result2).to eq(1)
    end
end
