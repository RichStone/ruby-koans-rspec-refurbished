require 'spec_helper'

def my_global_method(a,b)
  a + b
end

describe "Methods" do


  it "should demonstrate calling_global_methods" do
    expect(my_global_method(2,3)).to eql 5
  end

  it "should demonstrate calling_global_methods_without_parentheses" do
    result = my_global_method 2, 3
    expect(result).to eql 5
  end

  # (NOTE: We are Using eval below because the example code is
  # considered to be syntactically invalid).
  it "should demonstrate sometimes_missing_parentheses_are_ambiguous" do
    # eval "expect(5).should eql my_global_method 2, 3" # ENABLE CHECK
                                                 #
                                                 # Ruby doesn't know if you mean:
                                                 #
                                                 #   assert_equal(5, my_global_method(2), 3)
                                                 # or
                                                 #   assert_equal(5, my_global_method(2, 3))
                                                 #
                                                 # Rewrite the eval string to continue.
                                                 #
    eval "expect(5).to(eql(my_global_method(2,3)))"
  end

  # NOTE: wrong number of argument is not a SYNTAX error, but a
  # runtime error.
  it "should demonstrate calling_global_methods_with_wrong_number_of_arguments" do
    expect{ my_global_method }.to raise_error(ArgumentError, /wrong number of arguments/)

    expect{ my_global_method(1,2,3) }.to raise_error(ArgumentError, /wrong number of arguments/)
  end

  # ------------------------------------------------------------------

  def method_with_defaults(a, b=:default_value)
    [a, b]
  end

  it "should demonstrate calling_with_default_values" do
    expect(method_with_defaults(1)).to eql [1, :default_value]
    expect(method_with_defaults(1, 2)).to eql [1, 2]
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*args)
    args
  end

  it "should demonstrate calling_with_variable_arguments" do
    expect(method_with_var_args.class).to eql Array
    expect(method_with_var_args).to eql []
    expect(method_with_var_args(:one)).to eql [:one]
    expect(method_with_var_args(:one, :two)).to eql [:one, :two]
  end

  # ------------------------------------------------------------------

  def method_with_explicit_return
    :a_non_return_value
    return :return_value
    :another_non_return_value
  end

  it "should demonstrate method_with_explicit_return" do
    expect(method_with_explicit_return).to eql :return_value
  end

  # ------------------------------------------------------------------

  def method_without_explicit_return
    :a_non_return_value
    :return_value
  end

  it "should demonstrate method_without_explicit_return" do
    expect(method_without_explicit_return).to eql :return_value
  end

  # ------------------------------------------------------------------

  def my_method_in_the_same_class(a, b)
    a * b
  end

  it "should demonstrate calling_methods_in_same_class" do
    expect(my_method_in_the_same_class(3,4)).to eql 12
  end

  it "should demonstrate calling_methods_in_same_class_with_explicit_receiver" do
    expect(self.my_method_in_the_same_class(3,4)).to eql 12
  end

  # ------------------------------------------------------------------

  def my_private_method
    "a secret"
  end
  private :my_private_method

  it "should demonstrate calling_private_methods_without_receiver" do
    expect(my_private_method).to eql "a secret"
  end

  it "should demonstrate calling_private_methods_with_an_explicit_receiver" do
    # TODO: RSpec fix and lesson?
    expect { self.my_private_method }.not_to raise_error NoMethodError
  end

  # ------------------------------------------------------------------

  class Dog
    def name
      "Fido"
    end

    private

    def tail
      "tail"
    end
  end

  it "should demonstrate calling_methods_in_other_objects_require_explicit_receiver" do
    rover = Dog.new
    expect(rover.name).to eql "Fido"
  end

  it "should demonstrate calling_private_methods_in_other_objects" do
    rover = Dog.new
    # TODO: Fix RSpec syntax.
    expect { rover.tail }.to raise_error NoMethodError
  end
end
