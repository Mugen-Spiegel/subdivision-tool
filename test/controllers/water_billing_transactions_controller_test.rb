require "test_helper"

class WaterBillingTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @water_billing_transaction = water_billing_transactions(:one)
  end

  test "should get index" do
    get water_billing_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_water_billing_transaction_url
    assert_response :success
  end

  test "should create water_billing_transaction" do
    assert_difference("WaterBillingTransaction.count") do
      post water_billing_transactions_url, params: { water_billing_transaction: { current_reading: @water_billing_transaction.current_reading, previous_reading: @water_billing_transaction.previous_reading, subdivision_id: @water_billing_transaction.subdivision_id, user_id: @water_billing_transaction.user_id, water_billing_id: @water_billing_transaction.water_billing_id } }
    end

    assert_redirected_to water_billing_transaction_url(WaterBillingTransaction.last)
  end

  test "should show water_billing_transaction" do
    get water_billing_transaction_url(@water_billing_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_water_billing_transaction_url(@water_billing_transaction)
    assert_response :success
  end

  test "should update water_billing_transaction" do
    patch water_billing_transaction_url(@water_billing_transaction), params: { water_billing_transaction: { current_reading: @water_billing_transaction.current_reading, previous_reading: @water_billing_transaction.previous_reading, subdivision_id: @water_billing_transaction.subdivision_id, user_id: @water_billing_transaction.user_id, water_billing_id: @water_billing_transaction.water_billing_id } }
    assert_redirected_to water_billing_transaction_url(@water_billing_transaction)
  end

  test "should destroy water_billing_transaction" do
    assert_difference("WaterBillingTransaction.count", -1) do
      delete water_billing_transaction_url(@water_billing_transaction)
    end

    assert_redirected_to water_billing_transactions_url
  end
end
