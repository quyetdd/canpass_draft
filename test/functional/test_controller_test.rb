require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get septeni" do
    get :septeni
    assert_response :success
  end

end
