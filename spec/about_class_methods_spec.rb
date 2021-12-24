require 'spec_helper'

describe "Class Methods" do

  class Dog
  end

  it "should demonstrate objects_are_objects" do
    fido = Dog.new
    expect(fido.is_a?(Object)).to eql true
  end

  it "should demonstrate classes_are_classes" do
    expect(Dog.is_a?(Class)).to eql true
  end

  it "should demonstrate classes_are_objects_too" do
    expect(Dog.is_a?(Object)).to eql true
  end

  it "should demonstrate objects_have_methods" do
    fido = Dog.new
    expect(fido.methods.size).to be > 10
  end

  it "should demonstrate classes_have_methods" do
    expect(Dog.methods.size).to be > 10
  end

  it "should demonstrate you_can_define_methods_on_individual_objects" do
    fido = Dog.new

    def fido.gag
      :fidos_wag
    end

    expect(fido.gag).to eql :fidos_wag
  end

  it "should demonstrate other_objects_are_not_affected_by_these_singleton_methods" do
    fido = Dog.new
    rover = Dog.new

    def fido.lag
      :fidos_wag
    end

    # TODO: Fix RSpec syntax.
    # TODO: Fix exercise, test dependency again, wag is already defined.
    expect { rover.lag }.to raise_error(NoMethodError)
  end

  # ------------------------------------------------------------------

  class Dog2
    def wag
      :instance_level_wag
    end
  end

  def Dog2.wag
    :class_level_wag
  end

  it "should demonstrate since_classes_are_objects_you_can_define_singleton_methods_on_them_too" do
    expect(Dog2.wag).to eql :class_level_wag
  end

  it "should demonstrate class_methods_are_independent_of_instance_methods" do
    fido = Dog2.new
    expect(fido.wag).to eql :instance_level_wag
    expect(Dog2.wag).to eql :class_level_wag
  end

  # ------------------------------------------------------------------

  class Dog
    attr_accessor :name
  end

  def Dog.name
    @name
  end

  it "should demonstrate classes_and_instances_do_not_share_instance_variables" do
    fido = Dog.new
    fido.name = "Fido"
    expect(fido.name).to eql "Fido"
    expect(Dog.name).to eql nil
  end

  # ------------------------------------------------------------------

  class Dog
    def Dog.a_class_method
      :dogs_class_method
    end
  end

  it "should demonstrate you_can_define_class_methods_inside_the_class" do
    expect(Dog.a_class_method).to eql :dogs_class_method
  end


  # ------------------------------------------------------------------

  LastExpressionInClassStatement = class Dog
    21
  end

  it "should demonstrate class_statements_return_the_value_of_their_last_expression" do
    expect(LastExpressionInClassStatement).to eql 21
  end

  # ------------------------------------------------------------------

  SelfInsideOfClassStatement = class Dog
    self
  end

  it "should demonstrate self_while_inside_class_is_class_object_not_instance" do
    expect(Dog == SelfInsideOfClassStatement).to eql true
  end

  # ------------------------------------------------------------------

  class Dog
    def self.class_method2
      :another_way_to_write_class_methods
    end
  end

  it "should demonstrate you_can_use_self_instead_of_an_explicit_reference_to_dog" do
    expect(Dog.class_method2).to eql :another_way_to_write_class_methods
  end

  # ------------------------------------------------------------------

  class Dog
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it "should demonstrate heres_still_another_way_to_write_class_methods" do
    expect(Dog.another_class_method).to eql :still_another_way
  end

  # THINK ABOUT IT:
  #
  # The two major ways to write class methods are:
  #   class Demo
  #     def self.method
  #     end
  #
  #     class << self
  #       def class_methods
  #       end
  #     end
  #   end
  #
  # Which do you prefer and why?
  # Are there times you might prefer one over the other?
  #
  # => Lots of class methods: class << self
  # => Few class methods: def self.meth
  # READABILITY

  # ------------------------------------------------------------------

  it "should demonstrate heres_an_easy_way_to_call_class_methods_from_instance_methods" do
    fido = Dog.new
    expect(fido.class.another_class_method).to eql :still_another_way
  end
end
