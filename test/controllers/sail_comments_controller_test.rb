require 'test_helper'

class SailCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sail_comment = sail_comments(:one)
  end

  test "should get index" do
    get sail_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_sail_comment_url
    assert_response :success
  end

  test "should create sail_comment" do
    assert_difference('SailComment.count') do
      post sail_comments_url, params: { sail_comment: { content: @sail_comment.content, sail_id: @sail_comment.sail_id } }
    end

    assert_redirected_to sail_comment_url(SailComment.last)
  end

  test "should show sail_comment" do
    get sail_comment_url(@sail_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sail_comment_url(@sail_comment)
    assert_response :success
  end

  test "should update sail_comment" do
    patch sail_comment_url(@sail_comment), params: { sail_comment: { content: @sail_comment.content, sail_id: @sail_comment.sail_id } }
    assert_redirected_to sail_comment_url(@sail_comment)
  end

  test "should destroy sail_comment" do
    assert_difference('SailComment.count', -1) do
      delete sail_comment_url(@sail_comment)
    end

    assert_redirected_to sail_comments_url
  end
end
