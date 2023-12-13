require "test_helper"

class MonthlyDuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_due = monthly_dues(:one)
  end

  test "should get index" do
    get monthly_dues_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_due_url
    assert_response :success
  end

  test "should create monthly_due" do
    assert_difference("MonthlyDue.count") do
      post monthly_dues_url, params: { monthly_due: { amount: @monthly_due.amount, subdivision_id: @monthly_due.subdivision_id } }
    end

    assert_redirected_to monthly_due_url(MonthlyDue.last)
  end

  test "should show monthly_due" do
    get monthly_due_url(@monthly_due)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_due_url(@monthly_due)
    assert_response :success
  end

  test "should update monthly_due" do
    patch monthly_due_url(@monthly_due), params: { monthly_due: { amount: @monthly_due.amount, subdivision_id: @monthly_due.subdivision_id } }
    assert_redirected_to monthly_due_url(@monthly_due)
  end

  test "should destroy monthly_due" do
    assert_difference("MonthlyDue.count", -1) do
      delete monthly_due_url(@monthly_due)
    end

    assert_redirected_to monthly_dues_url
  end
end
