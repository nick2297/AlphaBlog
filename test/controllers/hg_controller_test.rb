require 'test_helper'

class HgControllerTest < ActionController::TestCase
  test "should get bn" do
    get :bn
    assert_response :success
  end

end
