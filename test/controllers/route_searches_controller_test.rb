require 'test_helper'

class RouteSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route_search = route_searches(:one)
  end

  test "should get index" do
    get route_searches_url
    assert_response :success
  end

  test "should get new" do
    get new_route_search_url
    assert_response :success
  end

  test "should create route_search" do
    assert_difference('RouteSearch.count') do
      post route_searches_url, params: { route_search: { Destination: @route_search.Destination, Source: @route_search.Source } }
    end

    assert_redirected_to route_search_url(RouteSearch.last)
  end

  test "should show route_search" do
    get route_search_url(@route_search)
    assert_response :success
  end

  test "should get edit" do
    get edit_route_search_url(@route_search)
    assert_response :success
  end

  test "should update route_search" do
    patch route_search_url(@route_search), params: { route_search: { Destination: @route_search.Destination, Source: @route_search.Source } }
    assert_redirected_to route_search_url(@route_search)
  end

  test "should destroy route_search" do
    assert_difference('RouteSearch.count', -1) do
      delete route_search_url(@route_search)
    end

    assert_redirected_to route_searches_url
  end
end
