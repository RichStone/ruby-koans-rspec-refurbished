require 'spec_helper'

describe "Arrays" do

  it 'should demonstrate array creation' do
    empty_array = Array.new
    expect(empty_array.class).to eql __
    expect(empty_array.size).to eql __
  end

  it "should demonstrate array literals" do
    array = Array.new
    expect(array).to eql []

    array[0] = 1
    expect(array).to eql [1]

    array[1] = 2
    expect(array).to eql [1, __]

    array << 333
    expect(array).to eql __
  end

  it "should demonstrate accessing array elements" do
    array = [:peanut, :butter, :and, :jelly]

    expect(array[0]).to eql __
    expect(array.first).to eql __
    expect(array[3]).to eql __
    expect(array.last).to eql __
    expect(array[-1]).to eql __
    expect(array[-3]).to eql __
  end

  it "should demonstrate slicing arrays" do
    array = [:peanut, :butter, :and, :jelly]

    expect(array[0,1]).to eql __
    expect(array[0,2]).to eql __
    expect(array[2,2]).to eql __
    expect(array[2,20]).to eql __
    expect(array[4,0]).to eql __
    expect(array[4,100]).to eql __
    expect(array[5,0]).to eql __
  end

  it "should show arrays and ranges" do
    array = [:peanut, :butter, :and, :jelly]

    expect((1..5).class).to eql __
    expect(1..5).not_to eql [1,2,3,4,5]
    expect((1..5).to_a).to eql __
    expect((1...5).to_a).to eql __
  end

  it "should demonstrate slicing with ranges" do
    array = [:peanut, :butter, :and, :jelly]

    expect(array[0..2]).to eql __
    expect(array[0...2]).to eql __
    expect(array[2..-1]).to eql __
  end

  it "should demonstrate pushing and popping arrays" do
    array = [1,2]
    array.push(:last)

    expect(array).to eql __

    popped_value = array.pop
    expect(popped_value).to eql __
    expect(array).to eql __
  end

  it "should demonstrate shifting arrays" do
    array = [1,2]
    array.unshift(:first)

    expect(array).to eql __

    shifted_value = array.shift
    expect(shifted_value).to eql __
    expect(array).to eql __
  end
end