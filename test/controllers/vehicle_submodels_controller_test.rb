require 'test_helper'

class VehicleSubmodelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_submodel = vehicle_submodels(:one)
  end

  test "should get index" do
    get vehicle_submodels_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_submodel_url
    assert_response :success
  end

  test "should create vehicle_submodel" do
    assert_difference('VehicleSubmodel.count') do
      post vehicle_submodels_url, params: { vehicle_submodel: { name: @vehicle_submodel.name, vehicle_model_id: @vehicle_submodel.vehicle_model_id } }
    end

    assert_redirected_to vehicle_submodel_url(VehicleSubmodel.last)
  end

  test "should show vehicle_submodel" do
    get vehicle_submodel_url(@vehicle_submodel)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_submodel_url(@vehicle_submodel)
    assert_response :success
  end

  test "should update vehicle_submodel" do
    patch vehicle_submodel_url(@vehicle_submodel), params: { vehicle_submodel: { name: @vehicle_submodel.name, vehicle_model_id: @vehicle_submodel.vehicle_model_id } }
    assert_redirected_to vehicle_submodel_url(@vehicle_submodel)
  end

  test "should destroy vehicle_submodel" do
    assert_difference('VehicleSubmodel.count', -1) do
      delete vehicle_submodel_url(@vehicle_submodel)
    end

    assert_redirected_to vehicle_submodels_url
  end
end
