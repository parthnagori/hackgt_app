require 'test_helper'

class GeCityApisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ge_city_api = ge_city_apis(:one)
  end

  test "should get index" do
    get ge_city_apis_url
    assert_response :success
  end

  test "should get new" do
    get new_ge_city_api_url
    assert_response :success
  end

  test "should create ge_city_api" do
    assert_difference('GeCityApi.count') do
      post ge_city_apis_url, params: { ge_city_api: {  } }
    end

    assert_redirected_to ge_city_api_url(GeCityApi.last)
  end

  test "should show ge_city_api" do
    get ge_city_api_url(@ge_city_api)
    assert_response :success
  end

  test "should get edit" do
    get edit_ge_city_api_url(@ge_city_api)
    assert_response :success
  end

  test "should update ge_city_api" do
    patch ge_city_api_url(@ge_city_api), params: { ge_city_api: {  } }
    assert_redirected_to ge_city_api_url(@ge_city_api)
  end

  test "should destroy ge_city_api" do
    assert_difference('GeCityApi.count', -1) do
      delete ge_city_api_url(@ge_city_api)
    end

    assert_redirected_to ge_city_apis_url
  end
end
