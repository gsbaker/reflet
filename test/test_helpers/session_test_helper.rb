module SessionTestHelper
  def sign_in(user)
    post session_url, params: { email: user.email, password: "secret123456" }
    assert session[:user_id].present?
  end

  def sign_out
    delete session_url
    assert_not session[:user_id].present?
  end
end
