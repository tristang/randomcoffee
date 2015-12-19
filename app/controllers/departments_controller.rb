class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(name: params[:department][:name])
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

end
