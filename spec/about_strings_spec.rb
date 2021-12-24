require 'spec_helper'

describe "Strings" do

  it "should demonstrate double_quoted_strings_are_strings" do
    string = "Hello, World"
    expect(string.is_a?(String)).to eql true
  end

  it "should demonstrate single_quoted_strings_are_also_strings" do
    string = 'Goodbye, World'
    expect(string.is_a?(String)).to eql true
  end

  it "should demonstrate use_single_quotes_to_create_string_with_double_quotes" do
    string = 'He said, "Go Away."'
    expect(string).to eql 'He said, "Go Away."'
  end

  it "should demonstrate use_double_quotes_to_create_strings_with_single_quotes" do
    string = "Don't"
    expect(string).to eql "Don't"
  end

  it "should demonstrate use_backslash_for_those_hard_cases" do
    a = "He said, \"Don't\""
    b = 'He said, "Don\'t"'
    expect(a == b).to eql true
  end

  it "should demonstrate use_flexible_quoting_to_handle_really_hard_cases" do
    a = %(flexible quotes can handle both ' and " characters)
    b = %!flexible quotes can handle both ' and " characters!
    c = %{flexible quotes can handle both ' and " characters}
    expect(a == b).to eql true
    expect(a == c).to eql true
    expect(b == c).to eql true
  end

  it "should demonstrate flexible_quotes_can_handle_multiple_lines" do
    long_string = %{
It was the best of times,
It was the worst of times.
}
    expect(long_string.length).to eql 54
    expect(long_string.lines.count).to eql 3
  end

  it "should demonstrate here_documents_can_also_handle_multiple_lines" do
    long_string = <<EOS
It was the best of times,
It was the worst of times.
EOS
    expect(long_string.length).to eql 53
    expect(long_string.lines.count).to eql 2
  end

  it "should demonstrate plus_will_concatenate_two_strings" do
    string = "Hello, " + "World"
    expect(string).to eql "Hello, World"
  end

  it "should demonstrate plus_concatenation_will_leave_the_original_strings_unmodified" do
    hi = "Hello, "
    there = "World"
    string = hi + there
    expect(hi).to eql "Hello, "
    expect(there).to eql "World"
  end

  it "should demonstrate plus_equals_will_concatenate_to_the_end_of_a_string" do
    hi = "Hello, "
    there = "World"
    hi += there
    expect(hi).to eql "Hello, World"
  end

  it "should demonstrate plus_equals_also_will_leave_the_original_string_unmodified" do
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi += there
    expect(original_string).to eql "Hello, "
  end

  it "should demonstrate the_shovel_operator_will_also_append_content_to_a_string" do
    hi = "Hello, "
    there = "World"
    hi << there
    expect(hi).to eql "Hello, World"
    expect(there).to eql "World"
  end

  it "should demonstrate the_shovel_operator_modifies_the_original_string" do
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi << there
    expect(original_string).to eql "Hello, World"

    # THINK ABOUT IT:
    #
    # Ruby programmers tend to favor the shovel operator (<<) over the
    # plus equals operator (+=) when building up strings. Why?
  end

  it "should demonstrate double_quoted_string_interpret_escape_characters" do
    string = "\n"
    expect(string.size).to eql 1
  end

  it "should demonstrate single_quoted_string_do_not_interpret_escape_characters" do
    string = '\n'
    expect(string.size).to eql 2
  end

  it "should demonstrate single_quotes_sometimes_interpret_escape_characters" do
    string = '\\\''
    expect(string.size).to eql 2
    expect(string).to eql '\\\''
  end

  it "should demonstrate double_quoted_strings_interpolate_variables" do
    value = 123
    string = "The value is #{value}"
    expect(string).to eql "The value is 123"
  end

  it "should demonstrate single_quoted_strings_do_not_interpolate" do
    value = 123
    string = 'The value is #{value}'
    expect(string).to eql 'The value is #{value}'
  end

  it "should demonstrate any_ruby_expression_may_be_interpolated" do
    string = "The square root of 5 is #{Math.sqrt(5)}"
    expect(string).to eql "The square root of 5 is 2.23606797749979"
  end

  it "should demonstrate you_can_get_a_substring_from_a_string" do
    string = "Bacon, lettuce and tomato"
    expect(string[7,3]).to eql "let"
    expect(string[7..9]).to eql "let"
  end

  it "should demonstrate you_can_get_a_single_character_from_a_string" do
    string = "Bacon, lettuce and tomato"
    expect(string[1]).to eql "a"

    # Surprised?
  end

  it "should demonstrate in_ruby_1_9_single_characters_are_represented_by_strings" do
    expect(?a).to eql "a"
    expect(?a == 97).to eql false
  end

  it "should demonstrate strings_can_be_split" do
    string = "Sausage Egg Cheese"
    words = string.split
    expect(words).to eql ["Sausage", "Egg", "Cheese"]
  end

  it "should demonstrate strings_can_be_split_with_different_patterns" do
    string = "the:rain:in:spain"
    words = string.split(/:/)
    expect(words).to eql ["the", "rain", "in", "spain"]

    words = string.split(":")
    expect(words).to eql ["the", "rain", "in", "spain"]

    # NOTE: Patterns are formed from Regular Expressions.  Ruby has a
    # very powerful Regular Expression library.  We will become
    # enlightened about them soon.
  end

  it "should demonstrate strings_can_be_joined" do
    words = ["Now", "is", "the", "time"]
    expect(words.join(" ")).to eql "Now is the time"
  end

  it "should demonstrate strings_are_unique_objects" do
    a = "a string"
    b = "a string"

    expect(a == b).to eql true
    expect(a.object_id == b.object_id).to eql false
  end
end
