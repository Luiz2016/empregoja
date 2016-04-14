class JobsController < ApplicationController
  before_action :set_companies, only: [:new, :create, :edit]
  before_action :set_categories, only: [:new, :create, :edit]

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

def update
  @job = Job.find(params[:id])
  if @job.update_attributes(job_params)
    redirect_to @job
  else
    render :edit
  end
end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_companies
    @companies = Company.all
  end

  def job_params
    params.require(:job)
      .permit(:title, :location, :category_id, :description, :featured,
             :company_id)
  end
end
