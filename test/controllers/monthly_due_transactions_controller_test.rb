require "test_helper"

class MonthlyDueTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_due_transaction = monthly_due_transactions(:one)
  end

  test "should get index" do
    get monthly_due_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_due_transaction_url
    assert_response :success
  end

  test "should create monthly_due_transaction" do
    assert_difference("MonthlyDueTransaction.count") do
      post monthly_due_transactions_url, params: { monthly_due_transaction: { is_paid: @monthly_due_transaction.is_paid, monthly_due_id: @monthly_due_transaction.monthly_due_id, subdivision_id: @monthly_due_transaction.subdivision_id, user_id: @monthly_due_transaction.user_id } }
    end

    assert_redirected_to monthly_due_transaction_url(MonthlyDueTransaction.last)
  end

  test "should show monthly_due_transaction" do
    get monthly_due_transaction_url(@monthly_due_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_due_transaction_url(@monthly_due_transaction)
    assert_response :success
  end

  test "should update monthly_due_transaction" do
    patch monthly_due_transaction_url(@monthly_due_transaction), params: { monthly_due_transaction: { is_paid: @monthly_due_transaction.is_paid, monthly_due_id: @monthly_due_transaction.monthly_due_id, subdivision_id: @monthly_due_transaction.subdivision_id, user_id: @monthly_due_transaction.user_id } }
    assert_redirected_to monthly_due_transaction_url(@monthly_due_transaction)
  end

  test "should destroy monthly_due_transaction" do
    assert_difference("MonthlyDueTransaction.count", -1) do
      delete monthly_due_transaction_url(@monthly_due_transaction)
    end

    assert_redirected_to monthly_due_transactions_url
  end
end
