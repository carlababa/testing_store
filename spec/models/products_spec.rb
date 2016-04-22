require "rails_helper"

describe Product do
  describe "validations" do
    it "requires a name" do
      product = Product.new(name: "")
      product.valid?
      expect(product.errors).to have_key(:name)
    end
  end

  describe "validations" do
    it "requires a description" do
      product = Product.new(description: "")
      product.valid?
      expect(product.errors).to have_key(:description)
    end
  end

  describe "validations" do
    it "does not require validation" do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors).not_to have_key(:calories)
    end
  end

  describe "#bargain?" do
    it "is true if price is less then 2.00" do
      product = Product.new(price: 1.50)
      expect(product.bargain?).to eq(true)
    end
    it "is false if price is equal or more then 2.00" do
      product = Product.new(price: 3.50)
      expect(product.bargain?).to eq(false)
    end
  end
end
