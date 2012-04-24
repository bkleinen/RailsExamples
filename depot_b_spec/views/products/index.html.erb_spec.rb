require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title1",
        :description => "MyText",
        :image_url => "ImageUrl.jpg",
        :price => "9.99"
      ),
      stub_model(Product,
        :title => "Title2",
        :description => "MyText",
        :image_url => "ImageUrl.jpg",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td>dl>dt", text: "Title1", count: 1
    assert_select "dt", text: "Title2", count: 1
    assert_select "dd", text: "MyText", count: 2
  end
end
