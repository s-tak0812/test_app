require "test_helper"

class TodoContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todo_contents_new_url
    assert_response :success
  end
end
