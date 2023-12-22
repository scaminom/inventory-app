require "test_helper"

class SuggestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suggestion = suggestions(:one)
  end

  test "should get index" do
    get suggestions_url, as: :json
    assert_response :success
  end

  test "should create suggestion" do
    assert_difference("Suggestion.count") do
      post suggestions_url, params: { suggestion: { description: @suggestion.description, title: @suggestion.title } }, as: :json
    end

    assert_response :created
  end

  test "should show suggestion" do
    get suggestion_url(@suggestion), as: :json
    assert_response :success
  end

  test "should update suggestion" do
    patch suggestion_url(@suggestion), params: { suggestion: { description: @suggestion.description, title: @suggestion.title } }, as: :json
    assert_response :success
  end

  test "should destroy suggestion" do
    assert_difference("Suggestion.count", -1) do
      delete suggestion_url(@suggestion), as: :json
    end

    assert_response :no_content
  end
end
