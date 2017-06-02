require 'test_helper'

class DistritosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get distritos_index_url
    assert_response :success
  end

end
