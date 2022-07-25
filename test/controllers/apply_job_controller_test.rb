require "test_helper"

class ApplyJobControllerTest < ActionDispatch::IntegrationTest
  test "should get apply" do
    get apply_job_apply_url
    assert_response :success
  end

  test "should get cancel" do
    get apply_job_cancel_url
    assert_response :success
  end
end
