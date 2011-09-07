require 'test_helper'

class LayoutLinksTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "home page at '/'" do
    get '/'
    assert_tag :title, content: /Home/
  end

  test "contact page at '/contact'" do
    get '/contact'
    assert_tag :title, content: /Contact/
  end

  test "about page at '/about'" do
    get '/about'
    assert_tag :title, content: /About/
  end

  test "help page at '/help'" do
    get '/help'
    assert_tag :title, content: /Help/
  end

  test "sign up page at '/signup'" do
    get '/signup'
    assert_tag :title, content: /Sign up/
  end
end

