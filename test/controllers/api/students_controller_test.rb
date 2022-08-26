require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get api_students_url, headers: token_authentication, as: :json
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post api_students_url, params: user_params, headers: token_authentication, as: :json
    end

    assert_response :created
  end

  test "should show student" do
    get api_student_url(@student),headers: token_authentication, as: :json
    assert_response :success
  end

  test "should update student" do
    patch api_student_url(@student), params: user_params, headers: token_authentication, as: :json
    assert_response :success
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete api_student_url(@student), headers: token_authentication, as: :json
    end

    assert_response :no_content
  end

  def user_params
    { name: "lucas", cpf: "092.254.23559", payment_method: :credit_card, birthdate: Date.new(2020, 1, 15)  }
  end

  def token_authentication
    { authorization: "Basic YWRtaW5fb3BzOmJpbGxpbmc=" }
  end
end
