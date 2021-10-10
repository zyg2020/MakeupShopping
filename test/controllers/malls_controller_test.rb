require "test_helper"

class MallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mall = malls(:one)
  end

  test "should get index" do
    get malls_url
    assert_response :success
  end

  test "should get new" do
    get new_mall_url
    assert_response :success
  end

  test "should create mall" do
    assert_difference('Mall.count') do
      post malls_url, params: { mall: { city: @mall.city, lat: @mall.lat, lng: @mall.lng, name: @mall.name } }
    end

    assert_redirected_to mall_url(Mall.last)
  end

  test "should show mall" do
    get mall_url(@mall)
    assert_response :success
  end

  test "should get edit" do
    get edit_mall_url(@mall)
    assert_response :success
  end

  test "should update mall" do
    patch mall_url(@mall), params: { mall: { city: @mall.city, lat: @mall.lat, lng: @mall.lng, name: @mall.name } }
    assert_redirected_to mall_url(@mall)
  end

  test "should destroy mall" do
    assert_difference('Mall.count', -1) do
      delete mall_url(@mall)
    end

    assert_redirected_to malls_url
  end
end
