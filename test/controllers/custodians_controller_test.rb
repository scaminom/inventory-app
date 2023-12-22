require "test_helper"

class CustodiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custodian = custodians(:one)
  end

  test "should get index" do
    get custodians_url, as: :json
    assert_response :success
  end

  test "should create custodian" do
    assert_difference("Custodian.count") do
      post custodians_url, params: { custodian: { degree: @custodian.degree, first_name: @custodian.first_name, last_name: @custodian.last_name, user_id: @custodian.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show custodian" do
    get custodian_url(@custodian), as: :json
    assert_response :success
  end

  test "should update custodian" do
    patch custodian_url(@custodian), params: { custodian: { degree: @custodian.degree, first_name: @custodian.first_name, last_name: @custodian.last_name, user_id: @custodian.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy custodian" do
    assert_difference("Custodian.count", -1) do
      delete custodian_url(@custodian), as: :json
    end

    assert_response :no_content
  end
end
