require "test_helper"

class VendorDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor_detail = vendor_details(:one)
  end

  test "should get index" do
    get vendor_details_url, as: :json
    assert_response :success
  end

  test "should create vendor_detail" do
    assert_difference('VendorDetail.count') do
      post vendor_details_url, params: { vendor_detail: { address: @vendor_detail.address, address_proof: @vendor_detail.address_proof, approved: @vendor_detail.approved, company_name: @vendor_detail.company_name, email: @vendor_detail.email, first_name: @vendor_detail.first_name, last_name: @vendor_detail.last_name, photo_id: @vendor_detail.photo_id, tnc: @vendor_detail.tnc, user_id: @vendor_detail.user_id, w9form: @vendor_detail.w9form } }, as: :json
    end

    assert_response 201
  end

  test "should show vendor_detail" do
    get vendor_detail_url(@vendor_detail), as: :json
    assert_response :success
  end

  test "should update vendor_detail" do
    patch vendor_detail_url(@vendor_detail), params: { vendor_detail: { address: @vendor_detail.address, address_proof: @vendor_detail.address_proof, approved: @vendor_detail.approved, company_name: @vendor_detail.company_name, email: @vendor_detail.email, first_name: @vendor_detail.first_name, last_name: @vendor_detail.last_name, photo_id: @vendor_detail.photo_id, tnc: @vendor_detail.tnc, user_id: @vendor_detail.user_id, w9form: @vendor_detail.w9form } }, as: :json
    assert_response 200
  end

  test "should destroy vendor_detail" do
    assert_difference('VendorDetail.count', -1) do
      delete vendor_detail_url(@vendor_detail), as: :json
    end

    assert_response 204
  end
end
