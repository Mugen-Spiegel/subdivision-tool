require "application_system_test_case"

class SubdivisionsTest < ApplicationSystemTestCase
  setup do
    @subdivision = subdivisions(:one)
  end

  test "visiting the index" do
    visit subdivisions_url
    assert_selector "h1", text: "Subdivisions"
  end

  test "should create subdivision" do
    visit subdivisions_url
    click_on "New subdivision"

    fill_in "City", with: @subdivision.city
    fill_in "Name", with: @subdivision.name
    fill_in "Postal code", with: @subdivision.postal_code
    click_on "Create Subdivision"

    assert_text "Subdivision was successfully created"
    click_on "Back"
  end

  test "should update Subdivision" do
    visit subdivision_url(@subdivision)
    click_on "Edit this subdivision", match: :first

    fill_in "City", with: @subdivision.city
    fill_in "Name", with: @subdivision.name
    fill_in "Postal code", with: @subdivision.postal_code
    click_on "Update Subdivision"

    assert_text "Subdivision was successfully updated"
    click_on "Back"
  end

  test "should destroy Subdivision" do
    visit subdivision_url(@subdivision)
    click_on "Destroy this subdivision", match: :first

    assert_text "Subdivision was successfully destroyed"
  end
end
