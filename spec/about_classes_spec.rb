require 'spec_helper'

describe "Classes" do

  class Dog
  end

  it "should demonstrate instances_of_classes_can_be_created_with_new" do
    fido = Dog.new
    expect(fido.class).to eql Dog
  end

  # ------------------------------------------------------------------

  class Dog2
    def set_name(a_name)
      @name = a_name
    end
  end

  it "should demonstrate instance_variables_can_be_set_by_assigning_to_them" do
    fido = Dog2.new
    expect(fido.instance_variables).to eql []

    fido.set_name("Fido")
    expect(fido.instance_variables).to eql [:@name]
  end

  it "should demonstrate instance_variables_cannot_be_accessed_outside_the_class" do
    fido = Dog2.new
    fido.set_name("Fido")

    expect { fido.name }.to raise_error(NoMethodError)

    expect { eval "fido.@name" }.to raise_error(SyntaxError)

    # NOTE: Using eval because the above line is a syntax error.
  end

  it "should demonstrate you_can_politely_ask_for_instance_variable_values" do
    fido = Dog2.new
    fido.set_name("Fido")

    expect(fido.instance_variable_get("@name")).to eql "Fido"
  end

  it "should demonstrate you_can_rip_the_value_out_using_instance_eval" do
    fido = Dog2.new
    fido.set_name("Fido")

    expect(fido.instance_eval("@name")).to eq "Fido"  # string version.should eql __
    expect(fido.instance_eval { @name }).to eq "Fido" # block version.should eql __
  end

  # ------------------------------------------------------------------

  class Dog3
    def set_name(a_name)
      @name = a_name
    end
    def name
      @name
    end
  end

  it "should demonstrate you_can_create_accessor_methods_to_return_instance_variables" do
    fido = Dog3.new
    fido.set_name("Fido")

    expect(fido.name).to eql "Fido"
  end

  # ------------------------------------------------------------------

  class Dog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end


  it "should demonstrate attr_reader_will_automatically_define_an_accessor" do
    fido = Dog4.new
    fido.set_name("Fido")

    expect(fido.name).to eql "Fido"
  end

  # ------------------------------------------------------------------

  class Dog5
    attr_accessor :name
  end


  it "should demonstrate attr_accessor_will_automatically_define_both_read_and_write_accessors" do
    fido = Dog5.new

    fido.name = "Fido"
    expect(fido.name).to eql "Fido"
  end

  # ------------------------------------------------------------------

  class Dog6
    attr_reader :name
    def initialize(initial_name)
      @name = initial_name
    end
  end

  it "should demonstrate initialize_provides_initial_values_for_instance_variables" do
    fido = Dog6.new("Fido")
    expect(fido.name).to eql "Fido"
  end

  it "should demonstrate args_to_new_must_match_initialize" do
    expect { Dog6.new }.to raise_error(ArgumentError)
    # THINK ABOUT IT:
    # Why is this so?
    #
    # => `new` is just a method of which the signature must be matched by the caller.
  end

  it "should demonstrate different_objects_have_different_instance_variables" do
    fido = Dog6.new("Fido")
    rover = Dog6.new("Rover")

    expect(rover.name != fido.name).to eql true
  end

  # ------------------------------------------------------------------

  class Dog7
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end

    def get_self
      self
    end

    def to_s
      name
    end

    def inspect
      "<Dog named '#{name}'>"
    end
  end

  it "should demonstrate inside_a_method_self_refers_to_the_containing_object" do
    fido = Dog7.new("Fido")

    fidos_self = fido.get_self
    expect(fidos_self).to eql fido
  end

  it "should demonstrate to_s_provides_a_string_version_of_the_object" do
    fido = Dog7.new("Fido")
    expect(fido.to_s).to eql "Fido"
  end

  it "should demonstrate to_s_is_used_in_string_interpolation" do
    fido = Dog7.new("Fido")
    expect("My dog is #{fido}").to eql "My dog is Fido"
  end

  it "should demonstrate inspect_provides_a_more_complete_string_version" do
    fido = Dog7.new("Fido")
    expect(fido.inspect).to eql "<Dog named 'Fido'>"
  end

  it "should demonstrate all_objects_support_to_s_and_inspect" do
    array = [1,2,3]

    expect(array.to_s).to eql "[1, 2, 3]"
    expect(array.inspect).to eql "[1, 2, 3]"

    expect("STRING".to_s).to eql "STRING"
    expect("STRING".inspect).to eql "\"STRING\""
  end

end
