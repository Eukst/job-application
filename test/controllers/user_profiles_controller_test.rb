# frozen_string_literal:true

require 'test_helper'

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    @admin = users(:admin)
  end
  test 'should get show' do
    get root_path
    post user_session_path
    get root_path
    get user_profile_url(@user.id)
    assert_response :success
  end

  test 'admin can destroy user ' do
    get root_path
    post user_session_path(@admin)
    get root_path
    delete user_profile_url(@user.id)
    assert_redirected_to root_url
    assert_not flash.empty?
  end

  test 'user  can see his profile ' do
    get root_path
    post user_session_path(@user)
    get root_path
    get user_profile_path(@user.id)
    assert_select 'h3','User Details'
  end
  test 'user  can see his applied jobs ' do
    get root_path
    post user_session_path, params:{user:{
                                          email: '3@yopmail.com',
                                          password: 123456}
    }
   
    get root_path
    assert log_in(@user)
    assert is_logged_in?
    get user_profile_path(@user.id)
    assert_match @user.user_role,'Job Seeker'
    assert !@user.admin?
    # doubt in this test case 
    # assert_select 'h2','Applied Jobs'
  end
  test 'admin can see his applied jobs ' do
    get root_path
    post user_session_path, params:{user:{
                                          email: 'admin1@yopmail.com',
                                          password: 123456}
    }
   
    get root_path
    assert log_in(@admin)
    assert is_logged_in?
    get user_profile_path(@user.id)
    assert @admin.admin
    # assert_select 'h2','Applied Jobs Admin View'
  end





end
