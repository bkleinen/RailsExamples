require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "Title",
      :description => "MyText",
      :image_url => "Image.jpg",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Image.jpg/)
    rendered.should match(/9.99/)
  end
end
