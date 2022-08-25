module Api
  class StudentsController < ApplicationController
    before_action :set_student, only: %i[update show destroy]

    def index
      @students = Student.all.limit(params[:count])
      render json: { page: params[:page], items: @students }.to_json, status: :ok
    end

    def create
      @student = Student.new(student_params)

      if @student.save
        render json: { id: @student.id }.to_json, status: :created
      else
        render json: @student.errors.to_json, status: :unprocessable_entity
      end
    end

    def show
      render json: @student.to_json, status: :ok
    end

    def update
      if @student.update(student_params)
        render json: { message: "Estudante atualizado com sucesso!" }.to_json, status: :ok
      else
        render json: @student.errors.to_json, status: :unprocessable_entity
      end
    end

    def destroy
      if @student.destroy
        render json: { message: "Estudante removido com sucesso!" }.to_json, status: :ok
      else
        render json: @student.errors.to_json, status: :unprocessable_entity
      end
    end

    private

    def student_params
      params.permit(:name, :payment_method, :birthdate, :cpf)
    end

    def set_student
      @student = Student.find(params[:id])
    end
  end
end
