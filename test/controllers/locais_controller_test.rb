require 'test_helper'

class LocaisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get locais_index_url
    assert_response :success
  end

end
