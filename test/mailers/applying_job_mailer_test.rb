require "test_helper"

class ApplyingJobMailerTest < ActionMailer::TestCase
  test "apply" do
    mail = ApplyingJobMailer.apply
    assert_equal "Apply", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "cancel" do
    mail = ApplyingJobMailer.cancel
    assert_equal "Cancel", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
