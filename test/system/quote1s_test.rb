require "application_system_test_case"

class Quote1sTest < ApplicationSystemTestCase
  setup do
    @quote1 = quote1s(:one)
  end

  test "visiting the index" do
    visit quote1s_url
    assert_selector "h1", text: "Quote1s"
  end

  test "creating a Quote1" do
    visit quote1s_url
    click_on "New Quote1"

    fill_in "Name", with: @quote1.name
    click_on "Create Quote1"

    assert_text "Quote1 was successfully created"
    click_on "Back"
  end

  test "updating a Quote1" do
    visit quote1s_url
    click_on "Edit", match: :first

    fill_in "Name", with: @quote1.name
    click_on "Update Quote1"

    assert_text "Quote1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote1" do
    visit quote1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote1 was successfully destroyed"
  end
end
