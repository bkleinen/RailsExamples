require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :title => "MyString",
      :description => "MyText",
      :image_url => "MyString",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    rendered.should have_selector("form", :action => products_path, :method => "post") do |form|
      form.should have_selector("input#product_title", :name => "product[title]")
      form.should have_selector("textarea#product_description", :name => "product[description]")
      form.should have_selector("input#product_image_url", :name => "product[image_url]")
      form.should have_selector("input#product_price", :name => "product[price]")
    end
  end
end
