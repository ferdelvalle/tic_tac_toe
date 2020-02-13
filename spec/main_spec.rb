#spec/calculator_spec.rb

RSpec.describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
  end
end

#spec/calculator_spec.rb

describe Calculator do
  #...
end

expect(calculator.add(5, 2)).to eql(7)#
