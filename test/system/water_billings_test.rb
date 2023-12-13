require "application_system_test_case"

class WaterBillingsTest < ApplicationSystemTestCase
  setup do
    @water_billing = water_billings(:one)
  end

  test "visiting the index" do
    visit water_billings_url
    assert_selector "h1", text: "Water billings"
  end

  test "should create water billing" do
    visit water_billings_url
    click_on "New water billing"

    fill_in "Is current price", with: @water_billing.is_current_price
    fill_in "Per cubic price", with: @water_billing.per_cubic_price
    fill_in "Subdivision", with: @water_billing.subdivision_id
    click_on "Create Water billing"

    assert_text "Water billing was successfully created"
    click_on "Back"
  end

  test "should update Water billing" do
    visit water_billing_url(@water_billing)
    click_on "Edit this water billing", match: :first

    fill_in "Is current price", with: @water_billing.is_current_price
    fill_in "Per cubic price", with: @water_billing.per_cubic_price
    fill_in "Subdivision", with: @water_billing.subdivision_id
    click_on "Update Water billing"

    assert_text "Water billing was successfully updated"
    click_on "Back"
  end

  test "should destroy Water billing" do
    visit water_billing_url(@water_billing)
    click_on "Destroy this water billing", match: :first

    assert_text "Water billing was successfully destroyed"
  end
end
