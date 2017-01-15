require 'test_helper'

class FitmentNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitment_note = fitment_notes(:one)
  end

  test "should get index" do
    get fitment_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_fitment_note_url
    assert_response :success
  end

  test "should create fitment_note" do
    assert_difference('FitmentNote.count') do
      post fitment_notes_url, params: { fitment_note: { name: @fitment_note.name, parent_id: @fitment_note.parent_id, used_for_search: @fitment_note.used_for_search } }
    end

    assert_redirected_to fitment_note_url(FitmentNote.last)
  end

  test "should show fitment_note" do
    get fitment_note_url(@fitment_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitment_note_url(@fitment_note)
    assert_response :success
  end

  test "should update fitment_note" do
    patch fitment_note_url(@fitment_note), params: { fitment_note: { name: @fitment_note.name, parent_id: @fitment_note.parent_id, used_for_search: @fitment_note.used_for_search } }
    assert_redirected_to fitment_note_url(@fitment_note)
  end

  test "should destroy fitment_note" do
    assert_difference('FitmentNote.count', -1) do
      delete fitment_note_url(@fitment_note)
    end

    assert_redirected_to fitment_notes_url
  end
end
