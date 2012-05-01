require 'spec_helper'

describe "store/index.html.erb" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title1",
        :description => "MyText1",
        :image_url => "ImageUrl.jpg",
        :price => "9.99"
      ),
      stub_model(Product,
        :title => "Title2",
        :description => "MyText2",
        :image_url => "ImageUrl.jpg",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    rendered.should have_content("Title1")
    rendered.should have_selector('h3', name: "Title1")
    rendered.should have_selector('h3', name: "Title2")
    rendered.should have_selector('h3', count: 2)
    rendered.should have_selector('.price', text: '9.99')
    
  end
end
