require "application_system_test_case"

class MonthlyDueTransactionsTest < ApplicationSystemTestCase
  setup do
    @monthly_due_transaction = monthly_due_transactions(:one)
  end

  test "visiting the index" do
    visit monthly_due_transactions_url
    assert_selector "h1", text: "Monthly due transactions"
  end

  test "should create monthly due transaction" do
    visit monthly_due_transactions_url
    click_on "New monthly due transaction"

    fill_in "Is paid", with: @monthly_due_transaction.is_paid
    fill_in "Monthly due", with: @monthly_due_transaction.monthly_due_id
    fill_in "Subdivision", with: @monthly_due_transaction.subdivision_id
    fill_in "User", with: @monthly_due_transaction.user_id
    click_on "Create Monthly due transaction"

    assert_text "Monthly due transaction was successfully created"
    click_on "Back"
  end

  test "should update Monthly due transaction" do
    visit monthly_due_transaction_url(@monthly_due_transaction)
    click_on "Edit this monthly due transaction", match: :first

    fill_in "Is paid", with: @monthly_due_transaction.is_paid
    fill_in "Monthly due", with: @monthly_due_transaction.monthly_due_id
    fill_in "Subdivision", with: @monthly_due_transaction.subdivision_id
    fill_in "User", with: @monthly_due_transaction.user_id
    click_on "Update Monthly due transaction"

    assert_text "Monthly due transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Monthly due transaction" do
    visit monthly_due_transaction_url(@monthly_due_transaction)
    click_on "Destroy this monthly due transaction", match: :first

    assert_text "Monthly due transaction was successfully destroyed"
  end
end
