require 'test_helper'

class AlertasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get alertas_index_url
    assert_response :success
  end

end
