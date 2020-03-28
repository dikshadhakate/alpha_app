require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	#Its call key methods, this method runs before test.
	def setup
		@category = Category.new(name: "Sports")
	end

	#test is the method for test and in quotes is the name of the test
	test "Category should be valid" do
		assert @category.valid? #It is our test
	end

	#validation for name
	test "Name should be present" do
		@category.name = " "
		assert_not @category.valid? #this is used for negative result like if @category.valid? returns false then only the test pass
	end

	test "Name should be unique" do 
		@category.save
		category2 = Category.new(name: "Sports") 
		assert_not category2.valid?
	end	

	test "Name should not too long" do
		@category.name = "a" * 26
		assert_not @category.valid?
	end 
	
	test "Name should not too short" do
		@category.name = "a" 
		assert_not @category.valid?
	end	
end	