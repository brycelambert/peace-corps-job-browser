class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def list
    conditions = {}

    conditions[:country] = params[:countries]

    @jobs = Job.find(:all, conditions: conditions)
    render json: @jobs
  end

end