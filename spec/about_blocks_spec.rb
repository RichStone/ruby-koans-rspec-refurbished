require 'spec_helper'

describe "Blocks" do

  def method_with_block
    result = yield
    result
  end

  it "should demonstrate methods_can_take_blocks" do
    yielded_result = method_with_block { 1 + 2 }
    expect(yielded_result).to eql 3
  end

  it "should demonstrate blocks_can_be_defined_with_do_end_too" do
    yielded_result = method_with_block do
      1 + 2
    end
    expect(yielded_result).to eql 3
  end

  # ------------------------------------------------------------------

  def method_with_block_arguments
    yield("Jim")
  end

  it "should demonstrate blocks_can_take_arguments" do
    result = method_with_block_arguments do |argument|
      expect(argument).to eql "Jim"
    end
  end

  # ------------------------------------------------------------------

  def many_yields
    yield(:peanut)
    yield(:butter)
    yield(:and)
    yield(:jelly)
  end

  it "should demonstrate methods_can_call_yield_many_times" do
    result = []
    many_yields { |item| result << item }
    expect(result).to eql [:peanut, :butter, :and, :jelly]
  end

  # ------------------------------------------------------------------

  def yield_tester
    if block_given?
      yield
    else
      :no_block
    end
  end

  it "should demonstrate methods_can_see_if_they_have_been_called_with_a_block" do
    expect(yield_tester { :with_block }).to eql :with_block
    expect(yield_tester).to eql :no_block
  end

  # ------------------------------------------------------------------

  it "should demonstrate block_can_affect_variables_in_the_code_where_they_are_created" do
    value = :initial_value
    method_with_block { value = :modified_in_a_block }
    expect(value).to eql :modified_in_a_block
  end

  it "should demonstrate blocks_can_be_assigned_to_variables_and_called_explicitly" do
    add_one = lambda { |n| n + 1 }
    expect(add_one.call(10)).to eql 11

    # Alternative calling sequence
    expect(add_one[10]).to eql 11
  end

  it "should demonstrate stand_alone_blocks_can_be_passed_to_methods_expecting_blocks" do
    make_upper = lambda { |n| n.upcase }
    result = method_with_block_arguments(&make_upper)
    expect(result).to eql "JIM"
  end

  # ------------------------------------------------------------------

  def method_with_explicit_block(&block)
    block.call(10)
  end

  it "should demonstrate methods_can_take_an_explicit_block_argument" do
    expect(method_with_explicit_block { |n| n * 2 }).to eql 20

    add_one = lambda { |n| n + 1 }
    expect(method_with_explicit_block(&add_one)).to eql 11
  end
end
