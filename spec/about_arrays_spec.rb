require 'spec_helper'

describe "Arrays" do

  it "should demonstrate array creation" do
    empty_array = Array.new
    expect(empty_array.class).to eql Array
    expect(empty_array.size).to eql 0
  end

  it "should demonstrate array literals" do
    array = Array.new
    expect(array).to eql []

    array[0] = 1
    expect(array).to eql [1]

    array[1] = 2
    expect(array).to eql [1, 2]

    array << 333
    expect(array).to eql [1, 2, 333]
  end

  it "should demonstrate accessing array elements" do
    array = [:peanut, :butter, :and, :jelly]

    expect(array[0]).to eql :peanut
    expect(array.first).to eql :peanut
    expect(array[3]).to eql :jelly
    expect(array.last).to eql :jelly
    expect(array[-1]).to eql :jelly
    expect(array[-3]).to eql :butter
  end

  it "should demonstrate slicing arrays" do
    array = [:peanut, :butter, :and, :jelly]

    expect(array[0,1]).to eql [:peanut]
    expect(array[0,2]).to eql [:peanut, :butter]
    expect(array[2,2]).to eql [:and, :jelly]
    expect(array[2,20]).to eql [:and, :jelly]
    expect(array[4,0]).to eql []
    expect(array[4,100]).to eql []
    expect(array[5,0]).to eql nil
  end

  it "should show arrays and ranges" do
    array = [:peanut, :butter, :and, :jelly]

    expect((1..5).class).to eql Range
    expect(1..5).not_to eql [1,2,3,4,5]
    expect((1..5).to_a).to eql [1,2,3,4,5]
    expect((1...5).to_a).to eql [1,2,3,4]
  end

  it "should demonstrate slicing with ranges" do
    array = [:peanut, :butter, :and, :jelly]

    expect(array[0..2]).to eql [:peanut, :butter, :and]
    expect(array[0...2]).to eql [:peanut, :butter]
    expect(array[2..-1]).to eql [:and, :jelly]
  end

  it "should demonstrate pushing and popping arrays" do
    array = [1,2]
    array.push(:last)

    expect(array).to eql [1,2, :last]

    popped_value = array.pop
    expect(popped_value).to eql :last
    expect(array).to eql [1,2]
  end

  it "should demonstrate shifting arrays" do
    array = [1,2]
    array.unshift(:first)

    expect(array).to eql [:first, 1,2]

    shifted_value = array.shift
    expect(shifted_value).to eql :first
    expect(array).to eql [1,2]
  end
end
