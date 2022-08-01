# frozen_string_literal:true

# controller to manage jobs
class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /jobs or /jobs.json
  def index
    authorize! :index, @user
    @jobs = Job.all
    @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(7)
  end

  # GET /jobs/1 or /jobs/1.json
  def show
    authorize! :show ,@job
    if user_signed_in? && (current_user.user_role.include? 'Employer')
      @user_apply = @job.users
      @user_apply_paginate = Kaminari.paginate_array(@user_apply).page(params[:page]).per(8)
    end
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.new
  end

  # GET /jobs/1/edit
  def edit
    authorize! :edit, @job
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    authorize! :destroy, @job
    @job.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:job_title, :experience, :salary, :user_id, :description)
  end
end
