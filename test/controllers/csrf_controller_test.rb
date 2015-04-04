require 'test_helper'

class CsrfControllerTest < ActionController::TestCase
  test "should return csrf token" do
    get :index
    assert_response :success
    assert(JSON.parse(@response.body).has_key?('authenticity_token'))
  end
end
