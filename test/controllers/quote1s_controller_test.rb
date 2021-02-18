require 'test_helper'

class Quote1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote1 = quote1s(:one)
  end

  test "should get index" do
    get quote1s_url
    assert_response :success
  end

  test "should get new" do
    get new_quote1_url
    assert_response :success
  end

  test "should create quote1" do
    assert_difference('Quote1.count') do
      post quote1s_url, params: { quote1: { name: @quote1.name } }
    end

    assert_redirected_to quote1_url(Quote1.last)
  end

  test "should show quote1" do
    get quote1_url(@quote1)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote1_url(@quote1)
    assert_response :success
  end

  test "should update quote1" do
    patch quote1_url(@quote1), params: { quote1: { name: @quote1.name } }
    assert_redirected_to quote1_url(@quote1)
  end

  test "should destroy quote1" do
    assert_difference('Quote1.count', -1) do
      delete quote1_url(@quote1)
    end

    assert_redirected_to quote1s_url
  end
end
