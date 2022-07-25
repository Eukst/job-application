# frozen_string_literal:true

# class for apply jobs
class ApplyJobsController < ApplicationController
  def show
    if user_signed_in? && (current_user.user_role.include? 'Job Seeker')
      params[:id].to_i
      current_user.id
    end
  end

  def destroy; end
end
