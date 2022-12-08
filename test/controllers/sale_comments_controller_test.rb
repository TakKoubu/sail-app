require 'test_helper'

class saleCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_comment = sale_comments(:one)
  end

  test "should get index" do
    get sale_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_comment_url
    assert_response :success
  end

  test "should create sale_comment" do
    assert_difference('saleComment.count') do
      post sale_comments_url, params: { sale_comment: { content: @sale_comment.content, sale_id: @sale_comment.sale_id } }
    end

    assert_redirected_to sale_comment_url(saleComment.last)
  end

  test "should show sale_comment" do
    get sale_comment_url(@sale_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_comment_url(@sale_comment)
    assert_response :success
  end

  test "should update sale_comment" do
    patch sale_comment_url(@sale_comment), params: { sale_comment: { content: @sale_comment.content, sale_id: @sale_comment.sale_id } }
    assert_redirected_to sale_comment_url(@sale_comment)
  end

  test "should destroy sale_comment" do
    assert_difference('saleComment.count', -1) do
      delete sale_comment_url(@sale_comment)
    end

    assert_redirected_to sale_comments_url
  end
end
