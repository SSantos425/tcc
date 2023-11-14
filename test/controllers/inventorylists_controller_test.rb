require "test_helper"

class InventorylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inventorylists_index_url
    assert_response :success
  end
end
