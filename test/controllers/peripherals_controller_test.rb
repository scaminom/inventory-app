require "test_helper"

class PeripheralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peripheral = peripherals(:one)
  end

  test "should get index" do
    get peripherals_url, as: :json
    assert_response :success
  end

  test "should create peripheral" do
    assert_difference("Peripheral.count") do
      post peripherals_url, params: { peripheral: { computer_id: @peripheral.computer_id, description: @peripheral.description, name: @peripheral.name } }, as: :json
    end

    assert_response :created
  end

  test "should show peripheral" do
    get peripheral_url(@peripheral), as: :json
    assert_response :success
  end

  test "should update peripheral" do
    patch peripheral_url(@peripheral), params: { peripheral: { computer_id: @peripheral.computer_id, description: @peripheral.description, name: @peripheral.name } }, as: :json
    assert_response :success
  end

  test "should destroy peripheral" do
    assert_difference("Peripheral.count", -1) do
      delete peripheral_url(@peripheral), as: :json
    end

    assert_response :no_content
  end
end
