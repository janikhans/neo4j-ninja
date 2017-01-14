require 'test_helper'

class FitmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitment = fitments(:one)
  end

  test "should get index" do
    get fitments_url
    assert_response :success
  end

  test "should get new" do
    get new_fitment_url
    assert_response :success
  end

  test "should create fitment" do
    assert_difference('Fitment.count') do
      post fitments_url, params: { fitment: { part_id: @fitment.part_id, vehicle_id: @fitment.vehicle_id } }
    end

    assert_redirected_to fitment_url(Fitment.last)
  end

  test "should show fitment" do
    get fitment_url(@fitment)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitment_url(@fitment)
    assert_response :success
  end

  test "should update fitment" do
    patch fitment_url(@fitment), params: { fitment: { part_id: @fitment.part_id, vehicle_id: @fitment.vehicle_id } }
    assert_redirected_to fitment_url(@fitment)
  end

  test "should destroy fitment" do
    assert_difference('Fitment.count', -1) do
      delete fitment_url(@fitment)
    end

    assert_redirected_to fitments_url
  end
end
