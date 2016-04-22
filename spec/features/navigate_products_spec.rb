require "rails_helper"

describe "Navigating products" do
  it "allows navigation from the detail page to the listing page" do
    product = Product.create(
      name: "soap",
      description: "very creamy",
      price: 2.00
      )

    visit product_url(product)
    click_link "Back"

    expect(current_path).to eq(products_path)
  end

  it "allows navigation from the new page to the listing page" do
    product = Product.create(
      name: "soap",
      description: "very creamy",
      price: 2.00
      )

    visit product_url("new")
    click_link "Back"

    expect(current_path).to eq(products_path)
  end
  it "allows navigation from the edit page to the listing page" do
    product = Product.create(
      name: "soap",
      description: "very creamy",
      price: 2.00
      )

    visit product_url(product.id)
    click_link "Back"

    expect(current_path).to eq(products_path)
  end
end
