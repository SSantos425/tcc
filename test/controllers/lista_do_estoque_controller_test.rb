require "test_helper"

class ListaDoEstoqueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lista_do_estoque_index_url
    assert_response :success
  end

  test "should get new" do
    get lista_do_estoque_new_url
    assert_response :success
  end

  test "should get create" do
    get lista_do_estoque_create_url
    assert_response :success
  end
end
