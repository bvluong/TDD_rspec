require 'rspec'
require 'crack_code_interview'

describe "rotate_array_left" do
  it "should rotate the array by the number inserted" do
    result1 = rotate_array_left([1,2,3,4,5],4)
    result2 = rotate_array_left([1,2,3,4,5],10)
    expect(result1).to eq([5,1,2,3,4])
    expect(result2).to eq([1,2,3,4,5])
  end
end

describe "find_anagram" do
  it "return number of characters to delete to make characters equal" do
    result1 = find_anagram('cde','abc')
    result2 = find_anagram('bacdc', 'dcbad')
    expect(result1).to eq(4)
    expect(result2).to eq(2)
  end
end
