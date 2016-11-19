require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get view" do
    get admin_view_url
    assert_response :success
  end

  test "should get delete" do
    get admin_delete_url
    assert_response :success
  end

  test "should get update" do
    get admin_update_url
    assert_response :success
  end

  test "should get add" do
    get admin_add_url
    assert_response :success
  end

end
