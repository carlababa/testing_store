require 'rails_helper'

describe ProductsController do
  describe "GET #index" do
    it "assign @products and renders index template" do
      product = Product.create(
      name: "soap",
      description: "very creamy",
      price: 2.00
      )

      get :index

      expect(assigns(:products)).to eq([product])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assign @products and render show template" do
      product = Product.create(
      name: "soap",
      description: "very creamy",
      price: 2.00
      )

      get :show, id: product.id

      expect(assigns(:product)).to eq(product)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assign a new products to @product and render new template"do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    let(:product) { Product.create(
      name: "soap",
      description: "very creamy",
      price: 2.00
      ) }

    before do
      get :edit, id: product.id
    end

    it "assign the requested products by id to @product" do
      expect(assigns(:product)).to eq(product)
    end
    it "render the template edit" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) {
        {product: {name: "soap",
        description: "very creamy",
        price: 2.00} } }

      it "creates a new product" do
        expect{ post :create, valid_params}.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, valid_params
        expect(response).to redirect_to(Product.last)
      end

      it "assign a newly created product to @product" do
        post :create, valid_params
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

  end
    context "with invalid params" do
      let(:invalid_params) {
        {product: {name: "soap",
        description: nil,
        price: 2.00} } }

      it "assigns a newly created but unsaved product as @product " do
        post :create, invalid_params
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the new template" do
        post :create, invalid_params
        expect(response).to render_template("new")
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:valid_params) {
  #       {product: {name: "soap",
  #       description: "very creamy",
  #       price: 2.00} } }
  #
  #     it "render show @product" do
  #       put :update, valid_params
  #       expect(response).to render_template("show")
  #     end
  #   end
  #
  # end

end
