require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get jobs_all_url
    assert_response :success
  end

end
