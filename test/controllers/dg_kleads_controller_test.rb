require 'test_helper'

class DgKleadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dg_klead = dg_kleads(:one)
  end

  test "should get index" do
    get dg_kleads_url
    assert_response :success
  end

  test "should get new" do
    get new_dg_klead_url
    assert_response :success
  end

  test "should create dg_klead" do
    assert_difference('DgKlead.count') do
      post dg_kleads_url, params: { dg_klead: { attachedFileStoredAsABinaryFile: @dg_klead.attachedFileStoredAsABinaryFile, companyName: @dg_klead.companyName, dateOfTheContactRequest: @dg_klead.dateOfTheContactRequest, departmentInChargeOfTheElevators: @dg_klead.departmentInChargeOfTheElevators, email: @dg_klead.email, fullNameOfTheContact: @dg_klead.fullNameOfTheContact, message: @dg_klead.message, phone: @dg_klead.phone, projectDescription: @dg_klead.projectDescription, projectName: @dg_klead.projectName } }
    end

    assert_redirected_to dg_klead_url(DgKlead.last)
  end

  test "should show dg_klead" do
    get dg_klead_url(@dg_klead)
    assert_response :success
  end

  test "should get edit" do
    get edit_dg_klead_url(@dg_klead)
    assert_response :success
  end

  test "should update dg_klead" do
    patch dg_klead_url(@dg_klead), params: { dg_klead: { attachedFileStoredAsABinaryFile: @dg_klead.attachedFileStoredAsABinaryFile, companyName: @dg_klead.companyName, dateOfTheContactRequest: @dg_klead.dateOfTheContactRequest, departmentInChargeOfTheElevators: @dg_klead.departmentInChargeOfTheElevators, email: @dg_klead.email, fullNameOfTheContact: @dg_klead.fullNameOfTheContact, message: @dg_klead.message, phone: @dg_klead.phone, projectDescription: @dg_klead.projectDescription, projectName: @dg_klead.projectName } }
    assert_redirected_to dg_klead_url(@dg_klead)
  end

  test "should destroy dg_klead" do
    assert_difference('DgKlead.count', -1) do
      delete dg_klead_url(@dg_klead)
    end

    assert_redirected_to dg_kleads_url
  end
end
