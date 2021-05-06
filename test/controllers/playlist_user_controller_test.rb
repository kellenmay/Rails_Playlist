require "test_helper"

class PlaylistUserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get playlist_user_new_url
    assert_response :success
  end

  test "should get create" do
    get playlist_user_create_url
    assert_response :success
  end

  test "should get edit" do
    get playlist_user_edit_url
    assert_response :success
  end

  test "should get update" do
    get playlist_user_update_url
    assert_response :success
  end

  test "should get destroy" do
    get playlist_user_destroy_url
    assert_response :success
  end
end
