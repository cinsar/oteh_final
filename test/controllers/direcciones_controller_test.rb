require 'test_helper'

class DireccionesControllerTest < ActionController::TestCase
  test "should get get_estados" do
    get :get_estados
    assert_response :success
  end

  test "should get get_municipios" do
    get :get_municipios
    assert_response :success
  end

end
