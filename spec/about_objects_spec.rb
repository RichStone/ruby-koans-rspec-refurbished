require 'spec_helper'

describe "Objects" do

  it "should show that everything is an object" do
    expect(1.is_a?(Object)).to eq(__)
    expect(1.5.is_a?(Object)).to eq(__)
    expect("string".is_a?(Object)).to eq(__)
    expect(nil.is_a?(Object)).to eq(__)
    expect(Object.is_a?(Object)).to eq(__)
  end

  it "should convert objects to strings" do
    expect(123.to_s).to eql __
    expect(nil.to_s).to eql __
  end

  it "should be able to be inspected" do
    expect(123.inspect).to eql __
    expect(nil.inspect).to eql __
  end

  it "should show that objects have ids" do
    obj = Object.new
    expect(obj.object_id.class).to eq(__)
  end

  it "should create objects with different ids" do
    obj = Object.new
    another_obj = Object.new
    expect(obj.object_id != another_obj.object_id).to eq(__)
  end

  it "should have the same object id for some system objects" do
    expect(false.object_id).to eq(__)
    expect(true.object_id).to eq(__)
    expect(nil.object_id).to eq(__)
  end

  it "should have fixed ids for small integers" do
    expect(0.object_id).to eq(__)
    expect(1.object_id).to eq(__)
    expect(2.object_id).to eq(__)
    expect(100.object_id).to eq(__)

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  it "should clone objects to create a different object" do
    obj = Object.new
    copy = obj.clone

    expect(obj != copy).to eq(__)
    expect(obj.object_id != copy.object_id).to eq(__)
  end
end