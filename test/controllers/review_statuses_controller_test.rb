require 'test_helper'

class ReviewStatusesControllerTest < ActionController::TestCase
  setup do
    @review_status = review_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_status" do
    assert_difference('ReviewStatus.count') do
      post :create, review_status: { feedback_id: @review_status.feedback_id, feedback_status: @review_status.feedback_status, note: @review_status.note, user_id: @review_status.user_id }
    end

    assert_redirected_to review_status_path(assigns(:review_status))
  end

  test "should show review_status" do
    get :show, id: @review_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_status
    assert_response :success
  end

  test "should update review_status" do
    patch :update, id: @review_status, review_status: { feedback_id: @review_status.feedback_id, feedback_status: @review_status.feedback_status, note: @review_status.note, user_id: @review_status.user_id }
    assert_redirected_to review_status_path(assigns(:review_status))
  end

  test "should destroy review_status" do
    assert_difference('ReviewStatus.count', -1) do
      delete :destroy, id: @review_status
    end

    assert_redirected_to review_statuses_path
  end
end
