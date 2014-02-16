class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def list
    conditions = {}
    conditions[:country] = params[:countries] unless params[:countries].nil
    conditions[:sector] = params[:sectors] unless params[:sectors].nil?
    conditions[:quarter] = params[:quarters].map { |value| value.to_i } unless params[:quarters].nil?

    @jobs = Job.find(:all, conditions: conditions)
    render json: @jobs
  end

end