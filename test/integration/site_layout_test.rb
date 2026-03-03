require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  # --- パターン①：ログインしていない時のテスト ---
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", login_path # ログイン「できる」リンクがある

  # --- パターン②：ログインしている時のテスト ---
    user = users(:michael) # テストデータを準備
    log_in_as(user)        # ログインする
    get root_path          # ログイン状態でHomeをもう一度開く

    assert_select "strong#following", count: 1
    assert_select "strong#followers", count: 1

    assert_select "a[href=?]", logout_path           # ログアウトがあるか
    assert_select "a[href=?]", users_path            # ユーザー一覧があるか
    assert_select "a[href=?]", user_path(user)       # プロフィールがあるか
    assert_select "a[href=?]", edit_user_path(user)  # 設定があるか
    assert_select "a[href=?]", login_path, count: 0  # ログインリンクが消えたか


    # Contactページのタイトルチェック
    get contact_path
    assert_select "title", full_title("Contact")
     # sign upページのタイトルチェック(先にちゃんと飛べるか,飛んだ先のページの中身（タイトル）が正しいか？)
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
