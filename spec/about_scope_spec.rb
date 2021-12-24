require 'spec_helper'
require_relative 'about_scope'

describe "AboutScope" do

  module Jims
    class Dogo
      def identify
        :jims_dog
      end
    end
  end

  module Joes
    class Dogo
      def identify
        :joes_dog
      end
    end
  end

  it "should demonstrate dog_is_not_available_in_the_current_scope" do
    # TODO: Fix RSpec.
    # TODO: Fix exercise, Dog is available because it's not cleaned up from
    # previous runs.
    expect { fido = Dogo.new }.to raise_error(NameError)
  end

  it "should demonstrate you_can_reference_nested_classes_using_the_scope_operator" do
    fido = Jims::Dogo.new
    rover = Joes::Dogo.new
    expect(fido.identify).to eql :jims_dog
    expect(rover.identify).to eql :joes_dog

    expect(fido.class != rover.class).to eql true
    expect(Jims::Dogo != Joes::Dogo).to eql true
  end

  # ------------------------------------------------------------------

  # TODO: This doesn't work as intended because we are in the wrong scope here :D
  # All needed constants are hence defined in about_scope.rb of the project.
  #
  # class String
  # end

  it "should demonstrate bare_bones_class_names_assume_the_current_scope" do
    expect(AboutScope::String == String).to eql false
  end

  it "should demonstrate nested_string_is_not_the_same_as_the_system_string" do
    expect(AboutScope::String == "HI".class).to eql false
  end

  it "should demonstrate use_the_prefix_scope_operator_to_force_the_global_scope" do
    expect(::String == "HI".class).to eql true
  end

  # ------------------------------------------------------------------

  # PI = 3.1416 (see about_scope.rb)

  it "should demonstrate constants_are_defined_with_an_initial_uppercase_letter" do
    expect(AboutScope::PI).to eql 3.1416
  end

  # ------------------------------------------------------------------

  # MyString = ::String (see about_scope.rb)

  it "should demonstrate class_names_are_just_constants" do
    expect(AboutScope::MyString == ::String).to eql true
    expect(AboutScope::MyString == "HI".class).to eql true
  end

  it "should demonstrate constants_can_be_looked_up_explicitly" do
    expect(AboutScope::PI == AboutScope.const_get("PI")).to eql true
    expect(AboutScope::MyString == AboutScope.const_get("MyString")).to eql true
  end

  it "should demonstrate you_can_get_a_list_of_constants_for_any_class_or_module" do
    expect(Jims.constants).to eql [:Dogo]
    # TODO: Fix exercise nested expects.
    expect(Object.constants.size).to be > 100
  end
end
