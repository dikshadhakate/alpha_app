require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new category form and create category" do
		get new_category_path  #assign the routes to the new category
		assert_template 'categories/new' #redirecting it to the new from
		assert_difference "Category.count", 1 do #submiting the form with the parameters
			post categories_path, params: {category: {name: "Sports"} }
			follow_redirect!
		end	
		assert_template 'categories/index' #redirecting it to the index page
		assert_match "Sports", response.body #checking wheater the category which have createed is present or not in the index page
	end

	test "Invalid category submition result in failure" do
		get new_category_path  #assign the routes to the new category
		assert_template 'categories/new' #redirecting it to the new from
		assert_no_difference "Category.count" do #submiting the form with the parameters
			post categories_path, params: {category: {name: " "} }
		end	
		assert_template 'categories/new' #redirecting it to the new page
		assert_select 'h2.panel-title' #To display error, we got this from shared/_errors.html.erb where we are displaing the title and body of the error
		assert_select 'div.panel-body' #To display error, we got this from shared/_errors.html.erb where we are displaing the title and body of the error
	end
		
end	