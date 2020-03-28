require "test_helper"

#In rails 5 Its ActionDispatch::IntegrationTest
# class CategoriesControllerTest < ActionDispatch::IntegrationTest
# end

class CategoriesControllerTest < ActionController::TestCase

	def setup
		@category = Category.create(name: "Sports")
	end

	test "Should get categories index" do
		get :index
		assert_response :success 
	end

	test "Should get new" do 
		get :new
		assert_response :success
	end	
	
	test "Should get show category" do
		get :show, params: { id: @category.id }
		assert_response :success
	end

end	