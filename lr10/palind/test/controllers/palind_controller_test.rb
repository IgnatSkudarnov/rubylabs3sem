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

  test 'should correct format xml to hash' do
    get '/palind/view.xml', params: {n1: 50}
    answer = {
    	'hash' => {
    		'result' => {
    			'description' => "Result Array",
    			'type' => 'Array', 'value' => assigns[:result]
    		}
    	}
    }
    assert_equal answer, Hash.from_xml(response.body)
  end

  test 'should have correct result tag' do
  	get '/palind/view.xml', params: {n1: 50}
  	assert_select 'result' do
  		assert_select 'type', 'Array'
  		result_array_value_answer = { 'value' => assigns[:result]}
  		assert_select 'value>value', result_array_value_answer  	
  	end
  end
end
