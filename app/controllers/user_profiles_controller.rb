# frozen_string_literal:true

# controller to manage user profiles
class UserProfilesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_user, only: %i[show destroy]
  before_action :authenticate_user!
  # user_profile_path  GET	/user_profiles/:id
  def show
    if params[:id].to_i == current_user.id.to_i && !current_user.admin
      if user_signed_in? && (current_user.user_role.include? 'Job Seeker') && !current_user.admin
        user = User.find(current_user.id)
        @jobs_user = user.jobs
        @jobs_user = Kaminari.paginate_array(@jobs_user).page(params[:page]).per(5)
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'UnAuthorize Access ' }
        format.json { head :no_content }
      end
    end

    if user_signed_in? && (current_user.admin)
      user = User.find(params[:id].to_i)
      @jobs_user = user.jobs
      @jobs_user = Kaminari.paginate_array(@jobs_user).page(params[:page]).per(5)
    end
  end

  # DELETE	/user_profiles/:id user_profile_path
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
