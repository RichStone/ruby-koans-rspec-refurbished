require 'spec_helper'

describe "Strings" do

  it "should demonstrate double_quoted_strings_are_strings" do
    string = "Hello, World"
    expect(string.is_a?(String)).to eql __
  end

  it "should demonstrate single_quoted_strings_are_also_strings" do
    string = 'Goodbye, World'
    expect(string.is_a?(String)).to eql __
  end

  it "should demonstrate use_single_quotes_to_create_string_with_double_quotes" do
    string = 'He said, "Go Away."'
    expect(string).to eql __
  end

  it "should demonstrate use_double_quotes_to_create_strings_with_single_quotes" do
    string = "Don't"
    expect(string).to eql __
  end

  it "should demonstrate use_backslash_for_those_hard_cases" do
    a = "He said, \"Don't\""
    b = 'He said, "Don\'t"'
    expect(a == b).to eql __
  end

  it "should demonstrate use_flexible_quoting_to_handle_really_hard_cases" do
    a = %(flexible quotes can handle both ' and " characters)
    b = %!flexible quotes can handle both ' and " characters!
    c = %{flexible quotes can handle both ' and " characters}
    expect(a == b).to eql __
    expect(a == c).to eql __
  end

  it "should demonstrate flexible_quotes_can_handle_multiple_lines" do
    long_string = %{
It was the best of times,
It was the worst of times.
}
    expect(long_string.length).to eql __
    expect(long_string.lines.count).to eql __
  end

  it "should demonstrate here_documents_can_also_handle_multiple_lines" do
    long_string = <<EOS
It was the best of times,
It was the worst of times.
EOS
    expect(long_string.length).to eql __
    expect(long_string.lines.count).to eql __
  end

  it "should demonstrate plus_will_concatenate_two_strings" do
    string = "Hello, " + "World"
    expect(string).to eql __
  end

  it "should demonstrate plus_concatenation_will_leave_the_original_strings_unmodified" do
    hi = "Hello, "
    there = "World"
    string = hi + there
    expect(hi).to eql __
    expect(there).to eql __
  end

  it "should demonstrate plus_equals_will_concatenate_to_the_end_of_a_string" do
    hi = "Hello, "
    there = "World"
    hi += there
    expect(hi).to eql __
  end

  it "should demonstrate plus_equals_also_will_leave_the_original_string_unmodified" do
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi += there
    expect(original_string).to eql __
  end

  it "should demonstrate the_shovel_operator_will_also_append_content_to_a_string" do
    hi = "Hello, "
    there = "World"
    hi << there
    expect(hi).to eql __
    expect(there).to eql __
  end

  it "should demonstrate the_shovel_operator_modifies_the_original_string" do
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi << there
    expect(original_string).to eql __

    # THINK ABOUT IT:
    #
    # Ruby programmers tend to favor the shovel operator (<<) over the
    # plus equals operator (+=) when building up strings.  Why?
  end

  it "should demonstrate double_quoted_string_interpret_escape_characters" do
    string = "\n"
    expect(string.size).to eql __
  end

  it "should demonstrate single_quoted_string_do_not_interpret_escape_characters" do
    string = '\n'
    expect(string.size).to eql __
  end

  it "should demonstrate single_quotes_sometimes_interpret_escape_characters" do
    string = '\\\''
    expect(string.size).to eql __
    expect(string).to eql __
  end

  it "should demonstrate double_quoted_strings_interpolate_variables" do
    value = 123
    string = "The value is #{value}"
    expect(string).to eql __
  end

  it "should demonstrate single_quoted_strings_do_not_interpolate" do
    value = 123
    string = 'The value is #{value}'
    expect(string).to eql __
  end

  it "should demonstrate any_ruby_expression_may_be_interpolated" do
    string = "The square root of 5 is #{Math.sqrt(5)}"
    expect(string).to eql __
  end

  it "should demonstrate you_can_get_a_substring_from_a_string" do
    string = "Bacon, lettuce and tomato"
    expect(string[7,3]).to eql __
    expect(string[7..9]).to eql __
  end

  it "should demonstrate you_can_get_a_single_character_from_a_string" do
    string = "Bacon, lettuce and tomato"
    expect(string[1]).to eql __

    # Surprised?
  end

  it "should demonstrate in_ruby_1_9_single_characters_are_represented_by_strings" do
    expect(?a).to eql __
    expect(?a == 97).to eql __
  end

  it "should demonstrate strings_can_be_split" do
    string = "Sausage Egg Cheese"
    words = string.split
    expect(words).to eql [__, __, __, __]
  end

  it "should demonstrate strings_can_be_split_with_different_patterns" do
    string = "the:rain:in:spain"
    words = string.split(/:/)
    expect(words).to eql [__, __, __, __]

    # NOTE: Patterns are formed from Regular Expressions.  Ruby has a
    # very powerful Regular Expression library.  We will become
    # enlightened about them soon.
  end

  it "should demonstrate strings_can_be_joined" do
    words = ["Now", "is", "the", "time"]
    expect(words.join(" ")).to eql __
  end

  it "should demonstrate strings_are_unique_objects" do
    a = "a string"
    b = "a string"

    expect(a == b).to eql __
    expect(a.object_id == b.object_id).to eql __
  end
end