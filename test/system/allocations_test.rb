require "application_system_test_case"

class AllocationsTest < ApplicationSystemTestCase
  setup do
    @allocation = allocations(:one)
  end

  test "visiting the index" do
    visit allocations_url
    assert_selector "h1", text: "Allocations"
  end

  test "creating a Allocation" do
    visit allocations_url
    click_on "New Allocation"

    fill_in "Amount", with: @allocation.amount
    fill_in "Belongs to", with: @allocation.belongs_to
    fill_in "Promised at", with: @allocation.promised_at
    fill_in "Status", with: @allocation.status
    click_on "Create Allocation"

    assert_text "Allocation was successfully created"
    click_on "Back"
  end

  test "updating a Allocation" do
    visit allocations_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @allocation.amount
    fill_in "Belongs to", with: @allocation.belongs_to
    fill_in "Promised at", with: @allocation.promised_at
    fill_in "Status", with: @allocation.status
    click_on "Update Allocation"

    assert_text "Allocation was successfully updated"
    click_on "Back"
  end

  test "destroying a Allocation" do
    visit allocations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Allocation was successfully destroyed"
  end
end
