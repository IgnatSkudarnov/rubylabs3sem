require 'test_helper'

class PalindControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palind_input_url
    assert_response :success
  end

  test "should get view" do
    get palind_view_url
    assert_response :success
  end

  test 'should get 3' do
    get palind_view_url, params: {n1: 30}
    answer = 3
    result = controller.instance_variable_get(:@result)[0]
    assert_equal answer, result
  end

  test 'should get 5' do
    get palind_view_url, params: {n1: 112}
    answer = 5
    result = controller.instance_variable_get(:@result)[0]
    assert_equal answer, result
  end
end
