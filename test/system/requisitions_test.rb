require "application_system_test_case"

class RequisitionsTest < ApplicationSystemTestCase
  setup do
    @requisition = requisitions(:one)
  end

  test "visiting the index" do
    visit requisitions_url
    assert_selector "h1", text: "Requisitions"
  end

  test "creating a Requisition" do
    visit requisitions_url
    click_on "New Requisition"

    fill_in "Url", with: @requisition.url
    click_on "Create Requisition"

    assert_text "Requisition was successfully created"
    click_on "Back"
  end

  test "updating a Requisition" do
    visit requisitions_url
    click_on "Edit", match: :first

    fill_in "Url", with: @requisition.url
    click_on "Update Requisition"

    assert_text "Requisition was successfully updated"
    click_on "Back"
  end

  test "destroying a Requisition" do
    visit requisitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requisition was successfully destroyed"
  end
end
