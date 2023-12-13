require "application_system_test_case"

class WaterBillingTransactionsTest < ApplicationSystemTestCase
  setup do
    @water_billing_transaction = water_billing_transactions(:one)
  end

  test "visiting the index" do
    visit water_billing_transactions_url
    assert_selector "h1", text: "Water billing transactions"
  end

  test "should create water billing transaction" do
    visit water_billing_transactions_url
    click_on "New water billing transaction"

    fill_in "Current reading", with: @water_billing_transaction.current_reading
    fill_in "Previous reading", with: @water_billing_transaction.previous_reading
    fill_in "Subdivision", with: @water_billing_transaction.subdivision_id
    fill_in "User", with: @water_billing_transaction.user_id
    fill_in "Water billing", with: @water_billing_transaction.water_billing_id
    click_on "Create Water billing transaction"

    assert_text "Water billing transaction was successfully created"
    click_on "Back"
  end

  test "should update Water billing transaction" do
    visit water_billing_transaction_url(@water_billing_transaction)
    click_on "Edit this water billing transaction", match: :first

    fill_in "Current reading", with: @water_billing_transaction.current_reading
    fill_in "Previous reading", with: @water_billing_transaction.previous_reading
    fill_in "Subdivision", with: @water_billing_transaction.subdivision_id
    fill_in "User", with: @water_billing_transaction.user_id
    fill_in "Water billing", with: @water_billing_transaction.water_billing_id
    click_on "Update Water billing transaction"

    assert_text "Water billing transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Water billing transaction" do
    visit water_billing_transaction_url(@water_billing_transaction)
    click_on "Destroy this water billing transaction", match: :first

    assert_text "Water billing transaction was successfully destroyed"
  end
end
