require 'spec_helper'

describe "to_str" do

  class CanNotBeTreatedAsString
    def to_s
      "non-string-like"
    end
  end

  it "should demonstrate to_s_returns_a_string_representation" do
    not_like_a_string = CanNotBeTreatedAsString.new
    expect(not_like_a_string.to_s).to eql __
  end

  it "should demonstrate normally_objects_cannot_be_used_where_strings_are_expected" do
    expect(File.exist?(CanNotBeTreatedAsString.new)).to raise_error(__)
  end

  # ------------------------------------------------------------------

  class CanBeTreatedAsString
    def to_s
      "string-like"
    end

    def to_str
      to_s
    end
  end

  it "should demonstrate to_str_also_returns_a_string_representation" do
    like_a_string = CanBeTreatedAsString.new
    expect(like_a_string.to_str).to eql __
  end

  it "should demonstrate to_str_allows_objects_to_be_treated_as_strings" do
    expect(File.exist?(CanBeTreatedAsString.new)).to eql __
  end

  # ------------------------------------------------------------------

  def acts_like_a_string?(string)
    string = string.to_str if string.respond_to?(:to_str)
    string.is_a?(String)
  end

  it "should demonstrate user_defined_code_can_check_for_to_str" do
    expect(acts_like_a_string?(CanNotBeTreatedAsString.new)).to eql __
    expect(acts_like_a_string?(CanBeTreatedAsString.new)).to eql __
  end
end