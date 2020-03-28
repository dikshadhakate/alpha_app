require "test_helper"

#In rails 5 Its ActionDispatch::IntegrationTest
# class CategoriesControllerTest < ActionDispatch::IntegrationTest
# end

class CategoriesControllerTest < ActionController::TestCase

	def setup
		@user = User.create(username: "John", email: "john@example.com", admin: true, password: "123123123")
		@category = Category.create(name: "Sports")
	end

	test "Should get categories index" do
		get :index
		assert_response :success 
	end

	test "Should get new" do 
		session[:user_id] = @user.id
		get :new
		assert_response :success
	end	
	
	test "Should get show category" do
		get :show, params: { id: @category.id }
		assert_response :success
	end

	test "Should redirect create when admin not logged in" do
		assert_no_difference 'Category.count' do 
			post :create, params: {category: {name: "Sports"} }
		end	
		assert_redirected_to categories_path
	end	

end	