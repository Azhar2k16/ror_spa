class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :ensure_frame_response, only: [:new, :edit]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('employees', partial: 'employees/employee', locals: {employee: @employee}) }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('employees', partial: 'employees/employee', locals: {employee: @employee}) }
        format.html { redirect_to employee_url(@employee), notice: "Person successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@employee, partial: "employees/employee", locals: {employee: @employee}) }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@employee, partial: "employees/employee", locals: {employee: @employee}) }
        format.html { redirect_to employee_url(@employee), notice: "Person successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Person successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:f_name, :l_name, :email, :phone)
    end
end

  private

  def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
  end
