require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	test "admin should delete other user" do
        current_user = users(:one)
        sign_in(current_user)      
        assert_difference('User.count', -1) do
            delete erase_path(users(:two))
        end
        assert_redirected_to pages_dashboard_url
    end

    test "admin should change role to other user" do
        current_user = users(:one)
        sign_in(current_user)    
        assert(users(:two).role == 'admin') do
            patch change_path(users(:two))

        # assert_match(users(:two).role, 'admin') do
        # 	patch change_path(users(:two).id)
        end
        #assert_redirected_to pages_dashboard_url
    end


  # test "should get dashboard" do
  #   get pages_dashboard_url
  #   assert_response :success
  # end

end
