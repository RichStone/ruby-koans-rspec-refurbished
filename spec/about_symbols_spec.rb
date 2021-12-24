require 'spec_helper'

describe "Symbols" do

  it "should demonstrate symbols_are_symbols" do
    symbol = :ruby
    expect(symbol.is_a?(Symbol)).to eql true
  end

  it "should demonstrate symbols_can_be_compared" do
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    expect(symbol1 == symbol2).to eql true
    expect(symbol1 == symbol3).to eql false
  end

  it "should demonstrate identical_symbols_are_a_single_internal_object" do
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    expect(symbol1 == symbol2).to eql true
    expect((symbol1.object_id == symbol2).object_id).to eql 0 # false.object_id
    expect((symbol1.object_id != symbol2).object_id).to eql 20 # true.object_id
    expect((symbol1.object_id == symbol2.object_id)).to eql true
  end

  it "should demonstrate method_names_become_symbols" do
    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    expect(symbols_as_strings.include?("test_method_names_become_symbols")).to eql true
  end

  # THINK ABOUT IT:
  #
  # Why do we convert the list of symbols to strings and then compare
  # against the string value rather than against symbols?
  it "behaves the same with symbols" do
    expect(Symbol.all_symbols.include?(:test_method_names_become_symbols)).to eql true
  end

  RubyConstant = "What is the sound of one hand clapping?"

  it "should demonstrate constants_become_symbols" do
    all_symbols = Symbol.all_symbols

    expect(all_symbols.include?(:RubyConstant)).to eql true
  end

  it "should demonstrate symbols_can_be_made_from_strings" do
    string = "catsAndDogs"
    expect(string.to_sym).to eql :catsAndDogs
  end

  it "should demonstrate symbols_with_spaces_can_be_built" do
    symbol = :"cats and dogs"

    expect(symbol).to eql "cats and dogs".to_sym
  end

  it "should demonstrate symbols_with_interpolation_can_be_built" do
    value = "and"
    symbol = :"cats #{value} dogs"

    expect(symbol).to eql "cats and dogs".to_sym
  end

  it "should demonstrate to_s_is_called_on_interpolated_symbols" do
    symbol = :cats
    string = "It is raining #{symbol} and dogs."

    expect(string).to eql "It is raining cats and dogs."
  end

  it "should demonstrate symbols_are_not_strings" do
    symbol = :ruby
    expect(symbol.is_a?(String)).to eql false
    expect(symbol.eql?("ruby")).to eql false
  end

  it "should demonstrate symbols_do_not_have_string_methods" do
    symbol = :not_a_string
    expect(symbol.respond_to?(:each_char)).to eql false
    expect(symbol.respond_to?(:reverse)).to eql false
  end

  # It's important to realize that symbols are not "immutable
  # strings", though they are immutable. None of the
  # interesting string operations are available on symbols.

  it "should demonstrate symbols_cannot_be_concatenated" do
    # Exceptions will be pondered further down the path
    # RSpec fix needed
    expect { :cats + :dogs }.to raise_error(NoMethodError)
  end

  it "should demonstrate symbols_can_be_dynamically_created" do
    expect(("cats" + "dogs").to_sym).to eql :catsdogs
  end

  # THINK ABOUT IT:
  #
  # Why is it not a good idea to dynamically create a lot of symbols?
  #
  # => Potential Memory Hog: https://stackoverflow.com/a/4574048/5925094
end
