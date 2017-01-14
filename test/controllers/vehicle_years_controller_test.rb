require 'test_helper'

class VehicleYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_year = vehicle_years(:one)
  end

  test "should get index" do
    get vehicle_years_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_year_url
    assert_response :success
  end

  test "should create vehicle_year" do
    assert_difference('VehicleYear.count') do
      post vehicle_years_url, params: { vehicle_year: { year: @vehicle_year.year } }
    end

    assert_redirected_to vehicle_year_url(VehicleYear.last)
  end

  test "should show vehicle_year" do
    get vehicle_year_url(@vehicle_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_year_url(@vehicle_year)
    assert_response :success
  end

  test "should update vehicle_year" do
    patch vehicle_year_url(@vehicle_year), params: { vehicle_year: { year: @vehicle_year.year } }
    assert_redirected_to vehicle_year_url(@vehicle_year)
  end

  test "should destroy vehicle_year" do
    assert_difference('VehicleYear.count', -1) do
      delete vehicle_year_url(@vehicle_year)
    end

    assert_redirected_to vehicle_years_url
  end
end
