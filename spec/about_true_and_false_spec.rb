require 'spec_helper'

describe "True and False" do

  def truth_value(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  it "should demonstrate true_is_treated_as_true" do
    expect(truth_value(true)).to eql :true_stuff
  end

  it "should demonstrate false_is_treated_as_false" do
    expect(truth_value(false)).to eql :false_stuff
  end

  it "should demonstrate nil_is_treated_as_false_too" do
    expect(truth_value(nil)).to eql :false_stuff
  end

  it "should demonstrate everything_else_is_treated_as_true" do
    expect(truth_value(1)).to eql :true_stuff
    expect(truth_value(0)).to eql :true_stuff
    expect(truth_value([])).to eql :true_stuff
    expect(truth_value({})).to eql :true_stuff
    expect(truth_value("Strings")).to eql :true_stuff
    expect(truth_value("")).to eql :true_stuff
  end
end
