require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test 'should get index' do
    get projects_path
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project), params: { project: { status: 'finished' } }
    assert_redirected_to conversation_history_project_path(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_path
  end

  test 'should display conversation history' do
    get conversation_history_project_path(@project)
    assert_response :success
  end
end
