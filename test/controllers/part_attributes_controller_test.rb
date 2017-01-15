require 'test_helper'

class PartAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_attribute = part_attributes(:one)
  end

  test "should get index" do
    get part_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_part_attribute_url
    assert_response :success
  end

  test "should create part_attribute" do
    assert_difference('PartAttribute.count') do
      post part_attributes_url, params: { part_attribute: { name: @part_attribute.name, parent_id: @part_attribute.parent_id } }
    end

    assert_redirected_to part_attribute_url(PartAttribute.last)
  end

  test "should show part_attribute" do
    get part_attribute_url(@part_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_attribute_url(@part_attribute)
    assert_response :success
  end

  test "should update part_attribute" do
    patch part_attribute_url(@part_attribute), params: { part_attribute: { name: @part_attribute.name, parent_id: @part_attribute.parent_id } }
    assert_redirected_to part_attribute_url(@part_attribute)
  end

  test "should destroy part_attribute" do
    assert_difference('PartAttribute.count', -1) do
      delete part_attribute_url(@part_attribute)
    end

    assert_redirected_to part_attributes_url
  end
end
