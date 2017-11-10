class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy ]

  def index
    @jobs = case params[:order]
            when "by_lower_bound"
              Job.where(:is_hidden => false).order("wage_lower_bound DESC")
            when "by_upper_bound"
              Job.where(:is_hidden => false).order("wage_upper_bound DESC")
            else
              Job.where(:is_hidden => false).recent
            end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      redirect_to root_path, alert: "Job is taken!"
    end
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: "Created"
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Successful"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
      redirect_to jobs_path, alert: "Delete Successful"
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden )
  end

end
