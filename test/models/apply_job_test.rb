# frozen_string_literal:true

require 'test_helper'

class ApplyJobTest < ActiveSupport::TestCase
  def setup
    @apply_job1 = apply_jobs(:one)
    @apply_job2 = apply_jobs(:two)
    @apply_job3 = apply_jobs(:three)
  end
  test 'apply job 1 should be valid ' do
    assert @apply_job1.valid?
  end
  test 'apply job 2 should be valid ' do
    assert @apply_job2.valid?
  end
  test 'apply job 3 should be valid ' do
    assert @apply_job3.valid?
  end
  test 'user_id job_id pair should be unique' do
    duplicate_pair = @apply_job1.dup
    @apply_job1.save
    assert_not duplicate_pair.valid?
  end
end
