require 'spec_helper'

describe "Iteration" do

  # -- An Aside ------------------------------------------------------
  # Ruby 1.8 stores names as strings. Ruby 1.9 stores names as
  # symbols. So we use a version dependent method "as_name" to convert
  # to the right format in the koans.  We will use "as_name" whenever
  # comparing two lists of methods.

  # Ok, now back to the Koans.
  # -------------------------------------------------------------------

  it "should demonstrate each_is_a_method_on_arrays" do
    # TODO: Ruby 1.8 support can be safely removed ;)
    expect([].methods.include?(:each)).to eql true
  end

  it "should demonstrate iterating_with_each" do
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    expect(sum).to eql 6
  end

  it "should demonstrate each_can_use_curly_brace_blocks_too" do
    array = [1, 2, 3]
    sum = 0
    array.each { |item|
      sum += item
    }
    expect(sum).to eql 6
  end

  # TODO: Demonstrate that reduce(&:+) is a shortcut for this 👆

  it "should demonstrate break_works_with_each_style_iterations" do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each { |item|
      break if item > 3
      sum += item
    }
    expect(sum).to eql 6
  end

  it "should demonstrate collect_transforms_elements_of_an_array" do
    array = [1, 2, 3]
    new_array = array.collect { |item| item + 10 }
    expect(new_array).to eql [11, 12, 13]

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }
    expect(another_array).to eql [11, 12, 13]
  end

  it "should demonstrate select_selects_certain_items_from_an_array" do
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    expect(even_numbers).to eql [2, 4, 6]

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    expect(more_even_numbers).to eql [2, 4, 6]
  end

  it "should demonstrate find_locates_the_first_element_matching_a_criteria" do
    array = ["Jim", "Bill", "Clarence", "Doug", "Eli"]

    expect(array.find { |item| item.size > 4 }).to eql "Clarence"
  end

  it "should demonstrate inject_will_blow_your_mind" do
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    expect(result).to eql 9

    result2 = [2, 3, 4].inject(1) { |result, item| result * item }
    expect(result2).to eql 24

    # TODO: reduce example

    # Extra Credit:
    # Describe in your own words what inject does.
    #
    # => Reduces a collection to a single value given a default starting value
    # and an operation to be performed on each value.
  end

  it "should demonstrate all_iteration_methods_work_on_any_collection_not_just_arrays" do
    # Ranges act like a collection
    result = (1..3).map { |item| item + 10 }
    expect(result).to eql [11, 12, 13]

    # Files act like a collection of lines
    File.open("example_file.txt") do |file|
      upcase_lines = file.map { |line| line.strip.upcase }
      expect(upcase_lines).to eql ["ASDF ADSF", "HUHU"]
    end

    # NOTE: You can create your own collections that work with each,
    # map, select, etc.
  end

  # Bonus Question:  In the previous koan, we saw the construct:
  #
  #   File.open(filename) do |file|
  #     # code to read 'file'
  #   end
  #
  # Why did we do it that way instead of the following?
  #
  #   file = File.open(filename)
  #   # code to read 'file'
  #
  # When you get to the "AboutSandwichCode" koan, recheck your answer.
  #
  # => The block closes the file automatically (?)

end
