require "application_system_test_case"

class MonthlyDuesTest < ApplicationSystemTestCase
  setup do
    @monthly_due = monthly_dues(:one)
  end

  test "visiting the index" do
    visit monthly_dues_url
    assert_selector "h1", text: "Monthly dues"
  end

  test "should create monthly due" do
    visit monthly_dues_url
    click_on "New monthly due"

    fill_in "Amount", with: @monthly_due.amount
    fill_in "Subdivision", with: @monthly_due.subdivision_id
    click_on "Create Monthly due"

    assert_text "Monthly due was successfully created"
    click_on "Back"
  end

  test "should update Monthly due" do
    visit monthly_due_url(@monthly_due)
    click_on "Edit this monthly due", match: :first

    fill_in "Amount", with: @monthly_due.amount
    fill_in "Subdivision", with: @monthly_due.subdivision_id
    click_on "Update Monthly due"

    assert_text "Monthly due was successfully updated"
    click_on "Back"
  end

  test "should destroy Monthly due" do
    visit monthly_due_url(@monthly_due)
    click_on "Destroy this monthly due", match: :first

    assert_text "Monthly due was successfully destroyed"
  end
end
