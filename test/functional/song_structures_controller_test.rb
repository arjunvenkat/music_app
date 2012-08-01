require 'test_helper'

class SongStructuresControllerTest < ActionController::TestCase
  setup do
    @song_structure = song_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_structure" do
    assert_difference('SongStructure.count') do
      post :create, song_structure: { note_id: @song_structure.note_id, order: @song_structure.order, section: @song_structure.section, song_id: @song_structure.song_id }
    end

    assert_redirected_to song_structure_path(assigns(:song_structure))
  end

  test "should show song_structure" do
    get :show, id: @song_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_structure
    assert_response :success
  end

  test "should update song_structure" do
    put :update, id: @song_structure, song_structure: { note_id: @song_structure.note_id, order: @song_structure.order, section: @song_structure.section, song_id: @song_structure.song_id }
    assert_redirected_to song_structure_path(assigns(:song_structure))
  end

  test "should destroy song_structure" do
    assert_difference('SongStructure.count', -1) do
      delete :destroy, id: @song_structure
    end

    assert_redirected_to song_structures_path
  end
end
