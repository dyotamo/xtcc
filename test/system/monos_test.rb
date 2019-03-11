require "application_system_test_case"

class MonosTest < ApplicationSystemTestCase
  setup do
    @mono = monos(:one)
  end

  test "visiting the index" do
    visit monos_url
    assert_selector "h1", text: "Monos"
  end

  test "creating a Mono" do
    visit monos_url
    click_on "New Mono"

    fill_in "Abstract", with: @mono.abstract
    fill_in "Author", with: @mono.author
    fill_in "Title", with: @mono.title
    fill_in "Year", with: @mono.year
    click_on "Create Mono"

    assert_text "Mono was successfully created"
    click_on "Back"
  end

  test "updating a Mono" do
    visit monos_url
    click_on "Edit", match: :first

    fill_in "Abstract", with: @mono.abstract
    fill_in "Author", with: @mono.author
    fill_in "Title", with: @mono.title
    fill_in "Year", with: @mono.year
    click_on "Update Mono"

    assert_text "Mono was successfully updated"
    click_on "Back"
  end

  test "destroying a Mono" do
    visit monos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mono was successfully destroyed"
  end
end
