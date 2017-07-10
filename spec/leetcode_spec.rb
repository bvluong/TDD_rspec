require 'rspec'
require 'leetcode'

describe "word_break" do
  it "should rotate the array by the number inserted" do
    result1 = word_break("catsanddog", ["cat", "cats", "and", "sand", "dog"])
    expect(result1).to eq(["cats and dog", "cat sand dog"])
  end
end
