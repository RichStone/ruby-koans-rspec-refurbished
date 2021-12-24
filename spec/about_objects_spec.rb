require 'spec_helper'

describe "Objects" do

  it "should show that everything is an object" do
    expect(1.is_a?(Object)).to eq(true)
    expect(1.5.is_a?(Object)).to eq(true)
    expect("string".is_a?(Object)).to eq(true)
    expect(nil.is_a?(Object)).to eq(true)
    expect(Object.is_a?(Object)).to eq(true)
    expect(RSpec.is_a?(Object)).to eq(true)
  end

  it "should convert objects to strings" do
    expect(123.to_s).to eql "123"
    expect(nil.to_s).to eql ""
  end

  it "should be able to be inspected" do
    expect(123.inspect).to eql "123"
    expect(nil.inspect).to eql "nil"
  end

  it "should show that objects have ids" do
    obj = Object.new
    expect(obj.object_id.class).to eq(Integer)
  end

  it "should create objects with different ids" do
    obj = Object.new
    another_obj = Object.new
    expect(obj.object_id != another_obj.object_id).to eq(true)
  end

  it "should have the same object id for some system objects" do
    expect(false.object_id).to eq(0)
    expect(true.object_id).to eq(20)
    expect(nil.object_id).to eq(8)
  end

  it "should have fixed ids for small integers" do
    expect(0.object_id).to eq(1)
    expect(1.object_id).to eq(3)
    expect(2.object_id).to eq(5)
    expect(100.object_id).to eq(201)

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  it "should clone objects to create a different object" do
    obj = Object.new
    copy = obj.clone

    expect(obj != copy).to eq(true)
    expect(obj.object_id != copy.object_id).to eq(true)
  end
end
