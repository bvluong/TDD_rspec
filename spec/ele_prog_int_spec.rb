require 'rspec'
require 'ele_prog_int'

describe "even_odd" do
  it "reorder array so even entries appear first" do
    result1 = even_odd([1,2,4,5,6,])
    expect(result1).to eq([6,2,4,5,1])
  end
end
