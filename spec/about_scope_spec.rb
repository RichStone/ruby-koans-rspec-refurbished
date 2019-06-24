require 'spec_helper'

describe "Scope" do

  module Jims
    class Dog
      def identify
        :jims_dog
      end
    end
  end

  module Joes
    class Dog
      def identify
        :joes_dog
      end
    end
  end

  it "should demonstrate dog_is_not_available_in_the_current_scope" do
    expect(fido = Dog.new).to raise_error(__)
  end

  it "should demonstrate you_can_reference_nested_classes_using_the_scope_operator" do
    fido = Jims::Dog.new
    rover = Joes::Dog.new
    expect(fido.identify).to eql __
    expect(rover.identify).to eql __

    expect(fido.class != rover.class).to eql __
    expect(Jims::Dog != Joes::Dog).to eql __
  end

  # ------------------------------------------------------------------

  class String
  end

  it "should demonstrate bare_bones_class_names_assume_the_current_scope" do
    expect(AboutScope::String == String).to eql __
  end

  it "should demonstrate nested_string_is_not_the_same_as_the_system_string" do
    expect(String == "HI".class).to eql __
  end

  it "should demonstrate use_the_prefix_scope_operator_to_force_the_global_scope" do
    expect(::String == "HI".class).to eql __
  end

  # ------------------------------------------------------------------

  PI = 3.1416

  it "should demonstrate constants_are_defined_with_an_initial_uppercase_letter" do
    expect(PI).to eql __
  end

  # ------------------------------------------------------------------

  MyString = ::String

  it "should demonstrate class_names_are_just_constants" do
    expect(MyString == ::String).to eql __
    expect(MyString == "HI".class).to eql __
  end

  it "should demonstrate constants_can_be_looked_up_explicitly" do
    expect(PI == AboutScope.const_get("PI")).to eql __
    expect(MyString == AboutScope.const_get("MyString")).to eql __
  end

  it "should demonstrate you_can_get_a_list_of_constants_for_any_class_or_module" do
    expect(Jims.constants).to eql __
    expect(expect(Object.constants.size)).to be > _n_
  end
end