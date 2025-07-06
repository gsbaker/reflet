module SystemTestHelper
  include ActionView::Helpers::JavaScriptHelper

  def sign_in(email, password = "secret123456")
    visit new_session_url

    fill_in "email", with: email
    fill_in "password", with: password

    click_on "sign_in"
    assert_selector "h1", text: "Clients"
  end
end
