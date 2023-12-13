require "test_helper"

class SubdivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subdivision = subdivisions(:one)
  end

  test "should get index" do
    get subdivisions_url
    assert_response :success
  end

  test "should get new" do
    get new_subdivision_url
    assert_response :success
  end

  test "should create subdivision" do
    assert_difference("Subdivision.count") do
      post subdivisions_url, params: { subdivision: { city: @subdivision.city, name: @subdivision.name, postal_code: @subdivision.postal_code } }
    end

    assert_redirected_to subdivision_url(Subdivision.last)
  end

  test "should show subdivision" do
    get subdivision_url(@subdivision)
    assert_response :success
  end

  test "should get edit" do
    get edit_subdivision_url(@subdivision)
    assert_response :success
  end

  test "should update subdivision" do
    patch subdivision_url(@subdivision), params: { subdivision: { city: @subdivision.city, name: @subdivision.name, postal_code: @subdivision.postal_code } }
    assert_redirected_to subdivision_url(@subdivision)
  end

  test "should destroy subdivision" do
    assert_difference("Subdivision.count", -1) do
      delete subdivision_url(@subdivision)
    end

    assert_redirected_to subdivisions_url
  end
end
