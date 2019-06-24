require 'spec_helper'

describe "Regular Expressions" do

  it "should demonstrate a_pattern_is_a_regular_expression" do
    expect(/pattern/.class).to eql __
  end

  it "should demonstrate a_regexp_can_search_a_string_for_matching_content" do
    expect("some matching content"[/match/]).to eql __
  end

  it "should demonstrate a_failed_match_returns_nil" do
    expect("some matching content"[/missing/]).to eql __
  end

  # ------------------------------------------------------------------

  it "should demonstrate question_mark_means_optional" do
    expect("abbcccddddeeeee"[/ab?/]).to eql __
    expect("abbcccddddeeeee"[/az?/]).to eql __
  end

  it "should demonstrate plus_means_one_or_more" do
    expect("abbcccddddeeeee"[/bc+/]).to eql __
  end

  it "should demonstrate asterisk_means_zero_or_more" do
    expect("abbcccddddeeeee"[/ab*/]).to eql __
    expect("abbcccddddeeeee"[/az*/]).to eql __
    expect("abbcccddddeeeee"[/z*/]).to eql __

    # THINK ABOUT IT:
    #
    # When would * fail to match?
  end

  # THINK ABOUT IT:
  #
  # We say that the repetition operators above are "greedy."
  #
  # Why?

  # ------------------------------------------------------------------

  it "should demonstrate the_left_most_match_wins" do
    expect("abbccc az"[/az*/]).to eql __
  end

  # ------------------------------------------------------------------

  it "should demonstrate character_classes_give_options_for_a_character" do
    animals = ["cat", "bat", "rat", "zat"]
    expect(animals.select { |a| a[/[cbr]at/] }).to eql __
  end

  it "should demonstrate slash_d_is_a_shortcut_for_a_digit_character_class" do
    expect("the number is 42"[/[0123456789]+/]).to eql __
    expect("the number is 42"[/\d+/]).to eql __
  end

  it "should demonstrate character_classes_can_include_ranges" do
    expect("the number is 42"[/[0-9]+/]).to eql __
  end

  it "should demonstrate slash_s_is_a_shortcut_for_a_whitespace_character_class" do
    expect("space: \t\n"[/\s+/]).to eql __
  end

  it "should demonstrate slash_w_is_a_shortcut_for_a_word_character_class" do
    # NOTE:  This is more like how a programmer might define a word.
    expect("variable_1 = 42"[/[a-zA-Z0-9_]+/]).to eql __
    expect("variable_1 = 42"[/\w+/]).to eql __
  end

  it "should demonstrate period_is_a_shortcut_for_any_non_newline_character" do
    expect("abc\n123"[/a.+/]).to eql __
  end

  it "should demonstrate a_character_class_can_be_negated" do
    expect("the number is 42"[/[^0-9]+/]).to eql __
  end

  it "should demonstrate shortcut_character_classes_are_negated_with_capitals" do
    expect("the number is 42"[/\D+/]).to eql __
    expect("space: \t\n"[/\S+/]).to eql __
    # ... a programmer would most likely do
    expect("variable_1 = 42"[/[^a-zA-Z0-9_]+/]).to eql __
    expect("variable_1 = 42"[/\W+/]).to eql __
  end

  # ------------------------------------------------------------------

  it "should demonstrate slash_a_anchors_to_the_start_of_the_string" do
    expect("start end"[/\Astart/]).to eql __
    expect("start end"[/\Aend/]).to eql __
  end

  it "should demonstrate slash_z_anchors_to_the_end_of_the_string" do
    expect("start end"[/end\z/]).to eql __
    expect("start end"[/start\z/]).to eql __
  end

  it "should demonstrate caret_anchors_to_the_start_of_lines" do
    expect("num 42\n2 lines"[/^\d+/]).to eql __
  end

  it "should demonstrate dollar_sign_anchors_to_the_end_of_lines" do
    expect("2 lines\nnum 42"[/\d+$/]).to eql __
  end

  it "should demonstrate slash_b_anchors_to_a_word_boundary" do
    expect("bovine vines"[/\bvine./]).to eql __
  end

  # ------------------------------------------------------------------

  it "should demonstrate parentheses_group_contents" do
    expect("ahahaha"[/(ha)+/]).to eql __
  end

  # ------------------------------------------------------------------

  it "should demonstrate parentheses_also_capture_matched_content_by_number" do
    expect("Gray, James"[/(\w+), (\w+)/, 1]).to eql __
    expect("Gray, James"[/(\w+), (\w+)/, 2]).to eql __
  end

  it "should demonstrate variables_can_also_be_used_to_access_captures" do
    expect("Name:  Gray, James"[/(\w+), (\w+)/]).to eql __
    expect($1).to eql __
    expect($2).to eql __
  end

  # ------------------------------------------------------------------

  it "should demonstrate a_vertical_pipe_means_or" do
    grays = /(James|Dana|Summer) Gray/
    expect("James Gray"[grays]).to eql __
    expect("Summer Gray"[grays, 1]).to eql __
    expect("Jim Gray"[grays, 1]).to eql __
  end

  # THINK ABOUT IT:
  #
  # Explain the difference between a character class ([...]) and alternation (|).

  # ------------------------------------------------------------------

  it "should demonstrate scan_is_like_find_all" do
    expect("one two-three".scan(/\w+/)).to eql __
  end

  it "should demonstrate sub_is_like_find_and_replace" do
    expect("one two-three".sub(/(t\w*)/) { $1[0, 1] }).to eql __
  end

  it "should demonstrate gsub_is_like_find_and_replace_all" do
    expect("one two-three".gsub(/(t\w*)/) { $1[0, 1] }).to eql __
  end
end