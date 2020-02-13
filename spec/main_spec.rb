require_relative '../lib/logic'
#spec/calculator_spec.rb
=begin
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
=end

RSpec.describe Players do
  describe "#initialize" do
    it "gets player name and assign to instance variable name" do
      player = Players.new("Me",'X')
      expect(player.name).to eql("Me")
    end

    it "initializes a player with a mark" do
      player = Players.new("Me",'X')
      expect(player.mark).to eql('X')
    end
  end
end