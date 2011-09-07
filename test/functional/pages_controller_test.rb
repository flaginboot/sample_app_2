require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test 'home should have the right title' do
    get :home
    assert_tag :title, content: @base_title + " | Home"
  end



  test "should get contact" do
    get :contact
    assert_response :success
  end

  test 'contact should have the right title' do
    get :contact
    assert_tag :title, content: @base_title + " | Contact"
  end



  test 'should get about' do
    get :about
    assert_response :success
  end

  test 'about should have the right title' do
    get :about
    assert_tag :title, content: @base_title + " | About"
  end



  test 'should get help' do
    get :help
    assert_response :success
  end
  test 'help should have the right title' do
    get :help
    assert_tag :title, content: @base_title + " | Help"
  end
end

