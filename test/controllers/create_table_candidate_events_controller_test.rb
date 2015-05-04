require 'test_helper'

class CreateTableCandidateEventsControllerTest < ActionController::TestCase
  setup do
    @create_table_candidate_event = create_table_candidate_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_table_candidate_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create_table_candidate_event" do
    assert_difference('CreateTableCandidateEvent.count') do
      post :create, create_table_candidate_event: { assistance: @create_table_candidate_event.assistance, candidate_id: @create_table_candidate_event.candidate_id, event_id: @create_table_candidate_event.event_id }
    end

    assert_redirected_to create_table_candidate_event_path(assigns(:create_table_candidate_event))
  end

  test "should show create_table_candidate_event" do
    get :show, id: @create_table_candidate_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @create_table_candidate_event
    assert_response :success
  end

  test "should update create_table_candidate_event" do
    patch :update, id: @create_table_candidate_event, create_table_candidate_event: { assistance: @create_table_candidate_event.assistance, candidate_id: @create_table_candidate_event.candidate_id, event_id: @create_table_candidate_event.event_id }
    assert_redirected_to create_table_candidate_event_path(assigns(:create_table_candidate_event))
  end

  test "should destroy create_table_candidate_event" do
    assert_difference('CreateTableCandidateEvent.count', -1) do
      delete :destroy, id: @create_table_candidate_event
    end

    assert_redirected_to create_table_candidate_events_path
  end
end
