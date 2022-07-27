class UserProfilesController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  def show; end

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
