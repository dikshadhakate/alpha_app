require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "Sports")
		@category2 = Category.create(name: "Fashion")
	end	

	test "should show Listing categories" do
		get categories_path #assign routes for index
		assert_template 'categories/index' #redirect_to index page
		assert_select "a[href=?]", category_path(@category), text: @category.name #select a link for the show page for perticular category 
		assert_select "a[href=?]", category_path(@category2), text: @category2.name
	end	
end	