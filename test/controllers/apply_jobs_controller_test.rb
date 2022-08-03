# frozen_string_literal:true

require 'test_helper'

class ApplyJobsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post apply_jobs_path
    assert_response :success
  end
end
