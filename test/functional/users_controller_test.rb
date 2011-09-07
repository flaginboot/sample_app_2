require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test 'new action should have right title' do
    get :new
    assert_tag :title, content: /Sign up/
  end
end

