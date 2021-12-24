require 'spec_helper'

describe "Regular Expressions" do

  it "should demonstrate a_pattern_is_a_regular_expression" do
    expect(/pattern/.class).to eql Regexp
  end

  it "should demonstrate a_regexp_can_search_a_string_for_matching_content" do
    expect("some matching content"[/match/]).to eql "match"
  end

  it "should demonstrate a_failed_match_returns_nil" do
    expect("some matching content"[/missing/]).to eql nil
  end

  # ------------------------------------------------------------------

  it "should demonstrate question_mark_means_optional" do
    expect("abbcccddddeeeee"[/ab?/]).to eql "ab"
    expect("abbcccddddeeeee"[/az?/]).to eql "a"
  end

  it "should demonstrate plus_means_one_or_more" do
    expect("abbcccddddeeeee"[/bc+/]).to eql "bccc"
  end

  it "should demonstrate asterisk_means_zero_or_more" do
    expect("abbcccddddeeeee"[/ab*/]).to eql "abb"
    expect("abbcccddddeeeee"[/az*/]).to eql "a"
    expect("abbcccddddeeeee"[/z*/]).to eql ""

    # THINK ABOUT IT:
    #
    # When would * fail to match?
    # => never
  end

  # THINK ABOUT IT:
  #
  # We say that the repetition operators above are "greedy."
  #
  # Why?
  #
  # => 'Greedy' means match longest possible string.

  # ------------------------------------------------------------------

  it "should demonstrate the_left_most_match_wins" do
    expect("abbccc az"[/az*/]).to eql "a"
  end

  # ------------------------------------------------------------------

  it "should demonstrate character_classes_give_options_for_a_character" do
    animals = ["cat", "bat", "rat", "zat"]
    expect(animals.select { |a| a[/[cbr]at/] }).to eql ["cat", "bat", "rat"]
  end

  it "should demonstrate slash_d_is_a_shortcut_for_a_digit_character_class" do
    expect("the number is 42"[/[0123456789]+/]).to eql "42"
    expect("the number is 42"[/\d+/]).to eql "42"
  end

  it "should demonstrate character_classes_can_include_ranges" do
    expect("the number is 42"[/[0-9]+/]).to eql "42"
  end

  it "should demonstrate slash_s_is_a_shortcut_for_a_whitespace_character_class" do
    expect("space: \t\n"[/\s+/]).to eql " \t\n"
  end

  it "should demonstrate slash_w_is_a_shortcut_for_a_word_character_class" do
    # NOTE:  This is more like how a programmer might define a word.
    expect("variable_1 = 42"[/[a-zA-Z0-9_]+/]).to eql "variable_1"
    expect("variable_1 = 42"[/\w+/]).to eql "variable_1"
  end

  it "should demonstrate period_is_a_shortcut_for_any_non_newline_character" do
    expect("abc\n123"[/a.+/]).to eql "abc"
  end

  it "should demonstrate a_character_class_can_be_negated" do
    expect("the number is 42"[/[^0-9]+/]).to eql "the number is "
  end

  it "should demonstrate shortcut_character_classes_are_negated_with_capitals" do
    expect("the number is 42"[/\D+/]).to eql "the number is "
    expect("space: \t\n"[/\S+/]).to eql "space:"
    # ... a programmer would most likely do
    expect("variable_1 = 42"[/[^a-zA-Z0-9_]+/]).to eql " = "
    expect("variable_1 = 42"[/\W+/]).to eql " = "
  end

  # ------------------------------------------------------------------

  it "should demonstrate slash_a_anchors_to_the_start_of_the_string" do
    expect("start end"[/\Astart/]).to eql "start"
    expect("start end"[/\Aend/]).to eql nil
  end

  it "should demonstrate slash_z_anchors_to_the_end_of_the_string" do
    expect("start end"[/end\z/]).to eql "end"
    expect("start end"[/start\z/]).to eql nil
  end

  it "should demonstrate caret_anchors_to_the_start_of_lines" do
    expect("num 42\n2 lines"[/^\d+/]).to eql "2"
  end

  it "should demonstrate dollar_sign_anchors_to_the_end_of_lines" do
    expect("2 lines\nnum 42"[/\d+$/]).to eql "42"
  end

  it "should demonstrate slash_b_anchors_to_a_word_boundary" do
    expect("bovine vines"[/\bvine./]).to eql "vines"
  end

  # ------------------------------------------------------------------

  it "should demonstrate parentheses_group_contents" do
    expect("ahahaha"[/(ha)+/]).to eql "hahaha"
  end

  # ------------------------------------------------------------------

  it "should demonstrate parentheses_also_capture_matched_content_by_number" do
    expect("Gray, James"[/(\w+), (\w+)/, 1]).to eql "Gray"
    expect("Gray, James"[/(\w+), (\w+)/, 2]).to eql "James"
  end

  it "should demonstrate variables_can_also_be_used_to_access_captures" do
    expect("Name:  Gray, James"[/(\w+), (\w+)/]).to eql "Gray, James"
    expect($1).to eql "Gray"
    expect($2).to eql "James"
  end

  # ------------------------------------------------------------------

  it "should demonstrate a_vertical_pipe_means_or" do
    grays = /(James|Dana|Summer) Gray/
    expect("James Gray"[grays]).to eql "James Gray"
    expect("Summer Gray"[grays, 1]).to eql "Summer"
    expect("Jim Gray"[grays, 1]).to eql nil
  end

  # THINK ABOUT IT:
  #
  # Explain the difference between a character class ([...]) and alternation (|).
  #
  # => Try representing a character class as alternation: [abc] vs (a|b|c)

  # ------------------------------------------------------------------

  it "should demonstrate scan_is_like_find_all" do
    expect("one two-three".scan(/\w+/)).to eql ["one", "two", "three"]
  end

  it "should demonstrate sub_is_like_find_and_replace" do
    expect("one two-three".sub(/(t\w*)/) { $1[0, 1] }).to eql "one t-three"
  end

  it "should demonstrate gsub_is_like_find_and_replace_all" do
    expect("one two-three".gsub(/(t\w*)/) { $1[0, 1] }).to eql "one t-t"
  end
end
