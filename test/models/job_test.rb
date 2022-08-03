# frozen_string_literaal:true
require 'test_helper'

# Class to test functionlity of job model
class JobTest < ActiveSupport::TestCase
  def setup
    @job = jobs(:one)
  end

  test 'job should be valid ' do
    assert @job.valid?
  end

  test 'job title should be present' do
    @job.job_title = '    '
    assert_not @job.valid?
  end
  test 'experience should be present' do
    @job.experience = '    '
    assert_not @job.valid?
  end
  test 'salary should be present' do
    @job.salary = '    '
    assert_not @job.valid?
  end
  test 'description should be present' do
    @job.description = '    '
    assert_not @job.valid?
  end
  test 'user_id should be present' do
    @job.user_id = '    '
    assert_not @job.valid?
  end
end
