require 'test_helper'

class Jobs::StatusClosedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jobs_status_closed_index_url
    assert_response :success
  end

end
