require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    # Contactページのタイトルチェック
    get contact_path
    assert_select "title", full_title("Contact")
     # sign upページのタイトルチェック(先にちゃんと飛べるか,飛んだ先のページの中身（タイトル）が正しいか？)
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
