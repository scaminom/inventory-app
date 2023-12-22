require "test_helper"

class AssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get assets_url, as: :json
    assert_response :success
  end

  test "should create asset" do
    assert_difference("Asset.count") do
      post assets_url, params: { asset: { amount: @asset.amount, computer_id: @asset.computer_id, custodian_id: @asset.custodian_id, description: @asset.description, laboratory_id: @asset.laboratory_id, name: @asset.name, stock: @asset.stock } }, as: :json
    end

    assert_response :created
  end

  test "should show asset" do
    get asset_url(@asset), as: :json
    assert_response :success
  end

  test "should update asset" do
    patch asset_url(@asset), params: { asset: { amount: @asset.amount, computer_id: @asset.computer_id, custodian_id: @asset.custodian_id, description: @asset.description, laboratory_id: @asset.laboratory_id, name: @asset.name, stock: @asset.stock } }, as: :json
    assert_response :success
  end

  test "should destroy asset" do
    assert_difference("Asset.count", -1) do
      delete asset_url(@asset), as: :json
    end

    assert_response :no_content
  end
end
