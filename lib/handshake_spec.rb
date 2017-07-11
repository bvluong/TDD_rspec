
RSpec.describe ShippingPriceController, :type => :controller do
  let(:user) { User.create!({username: "bryant_luong", password: "password"}) }

  describe "GET #price_for_current_user" do
    context "with valid params" do
    it "returns json object with valid product_id" do
      get :price_for_current_user, product_id: Product.first.id
      expect(JSON.parse(response)["price"]).to be_present
    end

    context "with invalid params" do
    it "returns json object with errors " do
      get :price_for_current_user, product_id: Product.last.id+1
      expect(JSON.parse(response)[:errors]).to eq('Please specify a product_id.')
    end
  end
end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        # If using Rails 5, you'll want to wrap your params like so:
        # post :create, params: { user: {username: "jill_bruce", password: ""} }
        post :create, user: { username: "jill_bruce", password: "" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: { username: "jill_bruce", password: "short" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to user show on success" do
        post :create, user: { username: "jill_bruce", password: "password" }
        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end
end

describe ShippingPriceCalculator do
  let(:product) { Product.first}
  let(:user) { User.first }
  let(:shipping_price_calc) { ShippingPriceCalculator.new(:product, :user) }

  describe '#initialize' do

    it 'sets up the user and product properly' do
      expect(shipping_price_calc.product).to eq(:product)
    end

    it 'raises an error with invalid user' do
      expect do
        ShippingPriceCalculator.new(:product, nil)
      end.to raise_error
    end

    it 'raises an error with an invalid product' do
      expect do
        ShippingPriceCalculator.new(nil. :user)
      end.to raise_error
    end
  end

  describe '#calulate' do
    let(:product2) { Product.new(warehouse_zipcode: 94089)}

    it 'returns a valid price' do
      expect(shipping_price_calc.calulate).to be_between(2,50).inclusive
    end

    it 'returns a price of 50.00 if user is international'
      subject(:user) { User.new(zipcode: "international") }
      subject(:shipping_price_calc2) { ShippingPriceCalculator.new(:product2, :user) }
      expect(shipping_price_calc2.calculate).to eq(50.00)
    end

    it 'returns a price of 2.00 if user is local'
      subject(:user) { User.new(zipcode: 94089) }
      subject(:shipping_price_calc2) { ShippingPriceCalculator.new(:product2, :user) }
      expect(shipping_price_calc2.calculate).to eq(2.00)
    end

  end
