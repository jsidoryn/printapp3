require 'test_helper'

class DesignersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get designers_new_url
    assert_response :success
  end

  test "should get create" do
    get designers_create_url
    assert_response :success
  end

end
