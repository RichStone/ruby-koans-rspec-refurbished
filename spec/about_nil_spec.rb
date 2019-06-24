require "spec_helper"

describe "Nil" do

  it "should show that nil is an object" do
    expect(nil.is_a?(Object)).to eq(__)
  end

  it "should not cause null pointer errors when calling methods on nil" do
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      expect(ex.class).to eq(__)

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      expect(ex.message).to match(/__/)
    end
  end

  it "should display methods nil has defined for it" do
    expect(nil.nil?).to eq __
    expect(nil.to_s).to eq __
    expect(nil.inspect).to eq __

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
  end

end