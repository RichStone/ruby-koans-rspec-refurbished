require 'spec_helper'

describe "Inheritance" do

  class Dog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      "WOOF"
    end
  end

  class Chihuahua < Dog
    def wag
      :happy
    end

    def bark
      "yip"
    end
  end

  it "should demonstrate subclasses_have_the_parent_as_an_ancestor" do
    expect(Chihuahua.ancestors.include?(Dog)).to eql true
  end

  it "should demonstrate all_classes_ultimately_inherit_from_object" do
    expect(Chihuahua.ancestors.include?(Object)).to eql true
  end

  # TODO: Examples are broken.
  # When the file is run separately all tests are green, but running everything
  # together raises an ArgumentError: wrong number of arguments (given 1, expected 0)
  # when a name is passed to Dog's subclasses, like SubClass.new("Name").
  # Might be a test dependency from previous runs.
  #
  # it "should demonstrate subclasses_inherit_behavior_from_parent_class" do
  #   chico = Chihuahua.new("Chico")
  #   expect(chico.name).to eql "Chico"
  # end
  #
  # it "should demonstrate subclasses_add_new_behavior" do
  #   chico = Chihuahua.new("Chico")
  #   expect(chico.wag).to eql :happy
  #
  #   expect do
  #     fido = Dog.new("Fido")
  #     fido.wag
  #   end.to raise_error(NoMethodError)
  # end
  #
  # it "should demonstrate subclasses_can_modify_existing_behavior" do
  #   chico = Chihuahua.new("Chico")
  #   expect(chico.bark).to eql "yip"
  #
  #   fido = Dog.new("Fido")
  #   expect(fido.bark).to eql "WOOF"
  # end

  # ------------------------------------------------------------------

  class BullDog < Dog
    def bark
      super + ", GROWL"
    end
  end

  it "should demonstrate subclasses_can_invoke_parent_behavior_via_super" do
    ralph = BullDog.new()
    expect(ralph.bark).to eql "WOOF, GROWL"
  end

  # ------------------------------------------------------------------

  class GreatDane < Dog
    def growl
      super.bark + ", GROWL"
    end
  end

  it "should demonstrate super_does_not_work_cross_method" do
    george = GreatDane.new()
    expect { george.growl }.to raise_error(NoMethodError)
  end

end
