require 'spec_helper'

describe "Hashes" do

  it "should demonstrate creating hashes" do
    empty_hash = Hash.new
    expect(empty_hash.class).to eql Hash
    expect(empty_hash).to eq({})
    expect(empty_hash.size).to eql 0
  end

  it "should demonstrate hash literals" do
    hash = { :one => "uno", :two => "dos" }
    expect(hash.size).to eql 2
  end

  it "should demonstrate accessing hashes" do
    hash = { :one => "uno", :two => "dos" }
    expect(hash[:one]).to eql "uno"
    expect(hash[:two]).to eql "dos"
    expect(hash[:doesnt_exist]).to eql nil
  end

  it "should demonstrate accessing hashes with fetch" do
    hash = { :one => "uno" }
    expect(hash.fetch(:one)).to eql "uno"
    expect{ hash.fetch(:doesnt_exist) }.to raise_error(KeyError)

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
    # To define a default or to explicitly raise an error when the key is missing
  end

  it "should demonstrate changing hashes" do
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => "eins", :two => "dos" }
    expect(expected == hash).to eql true

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
    # For readability?
  end

  it "should demonstrate that a hash is unordered" do
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    expect(hash1 == hash2).to eql true
  end

  it "should demonstrate hash keys" do
    hash = { :one => "uno", :two => "dos" }
    expect(hash.keys.size).to eql 2
    expect(hash.keys.include?(:one)).to eql true
    expect(hash.keys.include?(:two)).to eql true
    expect(hash.keys.class).to eql Array
  end

  it "should demonstrate hash values" do
    hash = { :one => "uno", :two => "dos" }
    expect(hash.values.size).to eql 2
    expect(hash.values.include?("uno")).to eql true
    expect(hash.values.include?("dos")).to eql true
    expect(hash.values.class).to eql Array
  end

  it "should demonstrate combining hashes" do
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    expect(hash != new_hash).to eql true

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
    expect(expected == new_hash).to eql true
  end

  it "should demonstrate default values" do
    hash1 = Hash.new
    hash1[:one] = 1

    expect(hash1[:one]).to eql 1
    expect(hash1[:two]).to eql nil

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    expect(hash2[:one]).to eql 1
    expect(hash2[:two]).to eql "dos"
  end

  it "should demonstrate that the default value is the same object" do
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    expect(hash[:one]).to eql ["uno", "dos"]
    expect(hash[:two]).to eql ["uno", "dos"]
    expect(hash[:three]).to eql ["uno", "dos"]

    expect(hash[:one].object_id == hash[:two].object_id).to eql true
  end

  it "should demonstrate default value with a block" do
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    expect(hash[:one]).to eql ["uno"]
    expect(hash[:two]).to eql ["dos"]
    expect(hash[:three]).to eql []
  end
end
