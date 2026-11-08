require "test_helper"

class UsersHelperTest < ActionView::TestCase
  test "gravatar uses the lowercase email and supports a custom size" do
    user = User.new(name: "Example User", email: "USER@EXAMPLE.COM")
    gravatar = gravatar_for(user, size: 50)

    assert_includes gravatar, "https://secure.gravatar.com/avatar/b58996c504c5638798eb6b511e6f49af?s=50"
    assert_includes gravatar, 'alt="Example User"'
    assert_includes gravatar, 'class="gravatar"'
  end
end
