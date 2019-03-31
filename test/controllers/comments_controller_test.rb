require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

	include Devise::Test::IntegrationHelpers

		test "admin should delete others comments" do
        current_user = users(:one)
        sign_in(current_user)
        assert_difference('Comment.count', -1) do
            delete post_path(comments(:two))
        end
        assert_redirected_to posts_url
    end

  # test "the truth" do
  #   assert true
  # end
end
