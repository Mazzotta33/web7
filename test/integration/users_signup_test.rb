require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "",
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
    assert_select "#error_explanation li", minimum: 1
    assert_select "input#user_password[value]", count: 0
  end

  test "valid signup information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Example User",
                                        email: "user@example.com",
                                        password: "password",
                                        password_confirmation: "password" } }
    end
    user = User.find_by!(email: "user@example.com")
    assert_redirected_to user
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
    assert_select "div.alert-success", "Welcome to the Sample App!"
    assert_select "h1", text: /Example User/
    assert_select "img.gravatar[alt=?]", user.name

    get user_path(user)
    assert flash.empty?
    assert_select "div.alert-success", count: 0
  end

  test "signup rejects an email already registered with different case" do
    User.create!(name: "Existing User", email: "user@example.com",
                 password: "password", password_confirmation: "password")

    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "Duplicate User",
                                        email: "USER@EXAMPLE.COM",
                                        password: "password",
                                        password_confirmation: "password" } }
    end
    assert_response :unprocessable_entity
    assert_select "#error_explanation li", "Email has already been taken"
  end

  test "signup ignores attributes outside strong parameters" do
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Example User",
                                        email: "user@example.com",
                                        password: "password",
                                        password_confirmation: "password",
                                        created_at: "2000-01-01" } }
    end
    assert_not_equal Date.new(2000, 1, 1), User.find_by!(email: "user@example.com").created_at.to_date
  end
end
