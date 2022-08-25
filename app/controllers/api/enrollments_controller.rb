module Api
  class EnrollmentsController < ApplicationController
    before_action :set_enrollment, only: %i[update show destroy]
    after_action :create_bills, only: %i[create update]

    def index
      @enrollments = Enrollment.all.limit(params[:count])
      render json: { page: params[:page], items: @enrollments }.to_json, status: :ok
    end

    def create
      @enrollment = Enrollment.new(enrollment_params)

      if @enrollment.save
        render json: { id: @enrollment.id }.to_json, status: :created
      else
        render json: @enrollment.errors.to_json, status: :unprocessable_entity
      end
    end

    def show
      render json: @enrollment.to_json, status: :ok
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
        render json: { message: "Matricula removida com sucesso!" }.to_json, status: :ok
      else
        render json: @enrollment.errors.to_json, status: :unprocessable_entity
      end
    end

    private

    def enrollment_params
      params.permit(:amount, :installments, :due_day)
    end

    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def create_bills; end
  end
end
