require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment = enrollments(:one)
    @student = Student.create({ name: "lucas", cpf: "092.254.23559", payment_method: :credit_card,
                                birthdate: Date.new(2020, 1, 15) })
  end

  test "should get index" do
    get api_enrollments_url, headers: token_authentication, as: :json
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference("Enrollment.count") do
      post api_enrollments_url, params: enrollment_params, headers: token_authentication, as: :json
    end

    assert_response :created
  end

  test "should show enrollment" do
    get api_enrollment_url(@enrollment), headers: token_authentication, as: :json
    assert_response :success
  end

  test "should update enrollment" do
    patch api_enrollment_url(@enrollment), params: enrollment_params, headers: token_authentication, as: :json
    assert_response :success
  end

  test "should destroy enrollment" do
    assert_difference("Enrollment.count", -1) do
      delete api_enrollment_url(@enrollment), headers: token_authentication, as: :json
    end

    assert_response :no_content
  end

  def enrollment_params
    {
      amount: 1_200_000,
      installments: 3,
      due_day: 5,
      student_id: @student.id
    }
  end

  def token_authentication
    { authorization: "Basic YWRtaW5fb3BzOmJpbGxpbmc=" }
  end
end
