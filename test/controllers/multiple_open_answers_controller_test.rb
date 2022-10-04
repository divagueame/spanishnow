require "test_helper"

class MultipleOpenAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiple_open_answer = multiple_open_answers(:one)
  end

  test "should get index" do
    get multiple_open_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_multiple_open_answer_url
    assert_response :success
  end

  test "should create multiple_open_answer" do
    assert_difference("MultipleOpenAnswer.count") do
      post multiple_open_answers_url, params: { multiple_open_answer: { multiple_open_piece_id: @multiple_open_answer.multiple_open_piece_id, user_answer: @multiple_open_answer.user_answer, user_id: @multiple_open_answer.user_id } }
    end

    assert_redirected_to multiple_open_answer_url(MultipleOpenAnswer.last)
  end

  test "should show multiple_open_answer" do
    get multiple_open_answer_url(@multiple_open_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiple_open_answer_url(@multiple_open_answer)
    assert_response :success
  end

  test "should update multiple_open_answer" do
    patch multiple_open_answer_url(@multiple_open_answer), params: { multiple_open_answer: { multiple_open_piece_id: @multiple_open_answer.multiple_open_piece_id, user_answer: @multiple_open_answer.user_answer, user_id: @multiple_open_answer.user_id } }
    assert_redirected_to multiple_open_answer_url(@multiple_open_answer)
  end

  test "should destroy multiple_open_answer" do
    assert_difference("MultipleOpenAnswer.count", -1) do
      delete multiple_open_answer_url(@multiple_open_answer)
    end

    assert_redirected_to multiple_open_answers_url
  end
end
