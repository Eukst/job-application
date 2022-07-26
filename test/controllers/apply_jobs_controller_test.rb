require "test_helper"

class ApplyJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get apply_jobs_show_url
    assert_response :success
  end

  test "should get destroy" do
    get apply_jobs_destroy_url
    assert_response :success
  end
end
