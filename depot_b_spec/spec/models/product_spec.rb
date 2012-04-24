require 'spec_helper'

describe Product do
  def valid_attributes
    {title:       'The Rspec Book',
        description: 'Even more testing',
        image_url:   'rspec.jpg',
        price:       22.95}
  end
  before do
    @product = Product.new(valid_attributes)
  end
  describe "validation" do
    it "should be created with valid attributes" do
      @product.should be_valid
    end
    it "should be invalid without title" do
      @product.title = nil
      @product.should_not be_valid
    end
    it "should be invalid without a description" do
      @product.description = ""
      @product.should_not be_valid
    end
    it "should not be valid if title is taken" do
      product2 = Product.new(valid_attributes)
      @product.should be_valid
      @product.save
      product2.save
      product2.should_not be_valid
    end
  end
  describe "image_url format" do
    describe "when invalid" do
        it "should be invalid" do
          urls = %w[foo bar.foo IMAGE]
          urls.each do |invalid_url|
            @product.image_url = invalid_url
            @product.should_not be_valid
          end      
        end
      end

      describe "when valid" do
        it "should be valid" do
          urls = %w[image.jpg bla.gif foo.png]
          urls.each do |valid_url|
            @product.image_url = valid_url
            @product.should be_valid
          end      
        end
      end
  end
  
end

