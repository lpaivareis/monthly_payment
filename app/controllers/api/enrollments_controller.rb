module Api
  class EnrollmentsController < ApplicationController
    before_action :set_enrollment, only: %i[update show destroy set_bills]
    after_action :set_bills, only: %i[create]

    def index
      @enrollments = Enrollment.joins(:bills).page(params[:page]).limit(params[:count])
      render json: { page: params[:page], count: @enrollments.count, items: @enrollments }, status: :ok,
             include: "bills"
    end

    def show
      render json: @enrollment, status: :ok, include: "bills"
    end

    def create
      @enrollment = Enrollment.new(enrollment_params)

      if @enrollment.save
        render json: { id: @enrollment.id }.to_json, status: :created
      else
        render json: @enrollment.errors.to_json, status: :unprocessable_entity
      end
    end

    def update
      if @enrollment.update(enrollment_params)
        render json: { message: "Matricula atualizada com sucesso!" }.to_json, status: :ok
      else
        render json: @enrollment.errors.to_json, status: :unprocessable_entity
      end
    end

    def destroy
      if @enrollment.destroy
        render json: { message: "Matricula removida com sucesso!" }.to_json, status: :no_content
      else
        render json: @enrollment.errors.to_json, status: :unprocessable_entity
      end
    end

    private

    def enrollment_params
      params.permit(:amount, :installments, :due_day, :student_id)
    end

    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def set_bills
      CreateBills.call(@enrollment)
    end
  end
end
