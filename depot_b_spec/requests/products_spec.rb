require 'spec_helper'

describe "Products" do
  describe "GET /products" do
    it "works! (now write some real specs)" do
      get products_path
      response.status.should be(200)
    end
  end
end
