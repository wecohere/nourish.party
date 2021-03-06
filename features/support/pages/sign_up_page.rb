# Encapsulates sign up functionality for feature tests
class SignUpPage < SitePrism::Page
  set_url "/users/sign_up/"

  element :email_field, "input[name='registered_user[email]']"
  element :password_field, "input[name='registered_user[password]']"
  element :confirm_password_field, "input[name='registered_user[password_confirmation]']"
  element :sign_up_button, "input[name='commit']"

  def submit(email:, password:, confirm_password: nil)
    email_field.set(email)
    password_field.set(password)
    confirm_password_field.set(confirm_password || password)
    sign_up_button.click
  end
end
