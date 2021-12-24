require 'spec_helper'

describe "Matchers" do

  it "should allow matching with equality operator" do
    expect(true).to eq(true)
  end

  it "should allow matching with built in matchers" do
    expect("afsd").to be_truthy
  end

  it "should allow matching with built in matchers and a message" do
    expect(true).not_to be_falsey, "This should be false -- Please fix this"
  end

  it "should allow matching of variables" do
    expected_value = 2
    actual_value = 1 + 1

    expect(actual_value).to eq(expected_value)
  end

  it "should allow matching of variables using a better way" do
    expected_value = 2
    actual_value = 1 + 1

    expect(actual_value).to eq(expected_value)
  end

  it "should allow matching of values using equality" do
    expected_value = 2
    actual_value = 1 + 1

    expect(actual_value).to eql(expected_value)
  end

  # We should all have our own unique identity
  it "should allow matching of identity using equality " do
    expected_value = "I should be something else"
    actual_value = "I should be something else"

    expect(actual_value).not_to equal(expected_value)
  end

  # Equal symbols have the same identity
  it "should allow matching of identity using equality " do
    expected_value = :symbol
    actual_value = :symbol

    expect(actual_value).to equal(expected_value)
  end

  it "should allow matching near values" do
    expect(2).to be_within(1).of(2)
  end

  it "does not match far away values" do
    expect(2).not_to be_within(1).of(4)
  end

  #be_nil            - nil
  #be                - nil
  #exist             - nil

  #be_a              - objects
  #be_an_instance_of - objects

  #cover             - ranges

  #end_with          - string
  #have              - string
  #have_at_least     - string
  #have_at_most      - string
  #start_with        - string
  #include           - string

  #match             - regex

  #include           - arrays
  #match_array       - arrays

end
