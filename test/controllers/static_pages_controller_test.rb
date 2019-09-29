require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "GET homepage" do
    get root_path
    assert_response :success
  end

  test "GET about" do
    get about_path
    assert_response :success
  end

  test "GET reviews" do
    get reviews_path
    assert_response :success
  end

  test "GET tours" do
    get tours_path
    assert_response :success
  end

  test "GET blog" do
    get blog_path
    assert_response :success
  end


end
