require "test_helper"

class WaterBillingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @water_billing = water_billings(:one)
  end

  test "should get index" do
    get water_billings_url
    assert_response :success
  end

  test "should get new" do
    get new_water_billing_url
    assert_response :success
  end

  test "should create water_billing" do
    assert_difference("WaterBilling.count") do
      post water_billings_url, params: { water_billing: { is_current_price: @water_billing.is_current_price, per_cubic_price: @water_billing.per_cubic_price, subdivision_id: @water_billing.subdivision_id } }
    end

    assert_redirected_to water_billing_url(WaterBilling.last)
  end

  test "should show water_billing" do
    get water_billing_url(@water_billing)
    assert_response :success
  end

  test "should get edit" do
    get edit_water_billing_url(@water_billing)
    assert_response :success
  end

  test "should update water_billing" do
    patch water_billing_url(@water_billing), params: { water_billing: { is_current_price: @water_billing.is_current_price, per_cubic_price: @water_billing.per_cubic_price, subdivision_id: @water_billing.subdivision_id } }
    assert_redirected_to water_billing_url(@water_billing)
  end

  test "should destroy water_billing" do
    assert_difference("WaterBilling.count", -1) do
      delete water_billing_url(@water_billing)
    end

    assert_redirected_to water_billings_url
  end
end
