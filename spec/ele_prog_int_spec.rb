require 'rspec'
require 'ele_prog_int'

describe "even_odd" do
  it "reorder array so even entries appear first" do
    result1 = even_odd([1,2,4,5,6,])
    expect(result1).to eq([6,2,4,5,1])
  end
end

describe "edit_distance" do
  it "return minimum of updates to match two strings" do
    result1 = edit_distance("sunday","saturday")
    result2 = edit_distance("","cat")
    result3 = edit_distance("a","ab")
    expect(result1).to eq(3)
    expect(result2).to eq(3)
    expect(result3).to eq(1)
  end
end

describe "matrix_in_spiral_order" do
  it "given a 2d array return the spiral order" do
    result1 = matrix_in_spiral_order([[1,2,3],[4,5,6],[7,8,9]])
    result2 = matrix_in_spiral_order(
    [[1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,16]])
    expect(result1).to eq([1,2,3,6,9,8,7,4,5])
    expect(result2).to eq([1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10])
  end
end
