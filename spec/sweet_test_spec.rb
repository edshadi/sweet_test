require_relative '../lib/sweet_test'
class Awesome
  attr_accessor :ness
  def initialize
    @ness = 0
  end
  def hello name
    raise ArgumentError.new("name must be a string") unless name.is_a?(String)
    "hello #{name}, your awesomeness is #{self.ness}"
  end
  def ness_up
    self.ness += 1
  end
  def awesome?
    self.ness > 0
  end
end

describe Awesome do
  let(:awesome) { Awesome.new }
  describe "#ness" do
    it "is inititalized with zero" do
      expect(awesome.ness).to_not.be_nil
      expect(awesome.ness).to.eq(0)
    end
  end

  describe "#hello" do
    it "it raises an Argument error if name is not a string" do
      expect { awesome.hello(1) }.to.raise_error(ArgumentError)
    end
    it "returns a hello message" do
      expect(awesome.hello("shadi")).to.eq("hello shadi, your awesomeness is 0")
    end
  end

  describe "#ness_up" do
    it "increments the ness" do
      a = awesome
      expect { a.ness_up }.to.change { a.ness }
    end
  end

  describe "#awesome?" do
    it "is false if ness is less 0" do
      expect(awesome.awesome?).to_not.be_true
    end
    it "is true if ness is higher than 0" do
      a = awesome
      expect { a.ness_up }.to.change { a.awesome? }
    end
  end
end
