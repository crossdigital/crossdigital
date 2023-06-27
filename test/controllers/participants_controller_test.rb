require "test_helper"

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get participants_edit_url
    assert_response :success
  end

  test "should get create" do
    get participants_create_url
    assert_response :success
  end
end
