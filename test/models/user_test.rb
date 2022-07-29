require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
  end

  test 'user should be valid ' do
    assert @user.valid?
  end

  test 'first name should be present' do
    @user.first_name = '    '
    assert_not @user.valid?
  end
  test 'last name should be present' do
    @user.last_name = '    '
    assert_not @user.valid?
  end
  test 'email should be present' do
    @user.email = '    '
    assert_not @user.valid?
  end
  test 'address should be present' do
    @user.address = '    '
    assert_not @user.valid?
  end
  test 'mobile_no should be present' do
    @user.mobile_no = '    '
    assert_not @user.valid?
  end
  test 'city should be present' do
    @user.city = '    '
    assert_not @user.valid?
  end
  test 'state should be present' do
    @user.state = '    '
    assert_not @user.valid?
  end
  test 'user role should be present' do
    @user.user_role = '    '
    assert_not @user.valid?
  end
  # length validations

  test 'pin should have 6 digit only ' do
    @user.pincode = '9' * 6
    assert @user.valid?
  end
  test 'pin should have not more than 6 ' do
    @user.pincode = '9' * 7
    assert_not @user.valid?
  end
  test 'pin should have not less than 6 ' do
    @user.pincode = '9' * 5
    assert_not @user.valid?
  end
  test 'pincode first digit not be zero ' do
    @user.pincode = '0' + '9' * 5
    assert_not @user.valid?
  end

  test 'mobile number should be less than 15' do
    @user.mobile_no = '9' * 16
    assert_not @user.valid?
  end
  test 'mobile number should be grateher than 9' do
    @user.mobile_no = '9' * 9
    assert_not @user.valid?
  end
  test 'mobile number with 15 digit should pass' do
    @user.mobile_no = 999999999999999
    assert @user.valid?
  end
  test 'mobile number with 10 digit should pass' do
    @user.mobile_no = 9999999999
    assert @user.valid?
  end
  
end
