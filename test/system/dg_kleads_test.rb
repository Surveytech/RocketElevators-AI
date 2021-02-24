require "application_system_test_case"

class DgKleadsTest < ApplicationSystemTestCase
  setup do
    @dg_klead = dg_kleads(:one)
  end

  test "visiting the index" do
    visit dg_kleads_url
    assert_selector "h1", text: "Dg Kleads"
  end

  test "creating a Dg klead" do
    visit dg_kleads_url
    click_on "New Dg Klead"

    fill_in "Attachedfilestoredasabinaryfile", with: @dg_klead.attachedFileStoredAsABinaryFile
    fill_in "Companyname", with: @dg_klead.companyName
    fill_in "Dateofthecontactrequest", with: @dg_klead.dateOfTheContactRequest
    fill_in "Departmentinchargeoftheelevators", with: @dg_klead.departmentInChargeOfTheElevators
    fill_in "Email", with: @dg_klead.email
    fill_in "Fullnameofthecontact", with: @dg_klead.fullNameOfTheContact
    fill_in "Message", with: @dg_klead.message
    fill_in "Phone", with: @dg_klead.phone
    fill_in "Projectdescription", with: @dg_klead.projectDescription
    fill_in "Projectname", with: @dg_klead.projectName
    click_on "Create Dg klead"

    assert_text "Dg klead was successfully created"
    click_on "Back"
  end

  test "updating a Dg klead" do
    visit dg_kleads_url
    click_on "Edit", match: :first

    fill_in "Attachedfilestoredasabinaryfile", with: @dg_klead.attachedFileStoredAsABinaryFile
    fill_in "Companyname", with: @dg_klead.companyName
    fill_in "Dateofthecontactrequest", with: @dg_klead.dateOfTheContactRequest
    fill_in "Departmentinchargeoftheelevators", with: @dg_klead.departmentInChargeOfTheElevators
    fill_in "Email", with: @dg_klead.email
    fill_in "Fullnameofthecontact", with: @dg_klead.fullNameOfTheContact
    fill_in "Message", with: @dg_klead.message
    fill_in "Phone", with: @dg_klead.phone
    fill_in "Projectdescription", with: @dg_klead.projectDescription
    fill_in "Projectname", with: @dg_klead.projectName
    click_on "Update Dg klead"

    assert_text "Dg klead was successfully updated"
    click_on "Back"
  end

  test "destroying a Dg klead" do
    visit dg_kleads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dg klead was successfully destroyed"
  end
end
