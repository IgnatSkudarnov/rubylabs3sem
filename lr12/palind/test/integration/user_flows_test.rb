require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'registration and calculation'do

    get signup_path
    assert_response :success

    post create_user_path, params: { user:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'palind', action: 'input'

    follow_redirect!
    get '/palind/view', params: { n1: 50 }

    answer = 3
    result = assigns[:result].first
    assert_in_delta answer, result
  end

  test 'registration and walk through pages'do
    
    get signup_path
    assert_response :success

    post create_user_path, params: { user:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'palind', action: 'input'

    follow_redirect!
    get '/palind/view', params: { n1: 50 }
    assert_response :success

    get user_path
    assert_response :success

    get users_path
    assert_response :success

    get user_edit_path
    assert_response :success

    post user_path, params: { user:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'users', action: 'show'

    get destroy_user_path
    assert_redirected_to root_path
  end
end
