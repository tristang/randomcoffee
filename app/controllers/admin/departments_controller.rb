class Admin::DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)
      redirect_to admin_departments_path, notice: "Saved changes to the #{@department.name} department"
    else
      render :edit
    end
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admin_departments_path
    else
      render :new
    end
  end

  private
  def department_params
    params.require(:department).permit(:name)
  end
end
