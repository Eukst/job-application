# frozen_string_literal:true

# comtroller to manage user profiles
class UserProfilesController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  def show
    if user_signed_in? && (current_user.user_role.include? 'Job Seeker') && (current_user.admin == false)
      user = User.find(current_user.id)
      @jobs_user = user.jobs
      @jobs_user = Kaminari.paginate_array(@jobs_user).page(params[:page]).per(5)
    end
  end

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
