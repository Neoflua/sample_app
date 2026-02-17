require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    # 引数なしの場合：ベースタイトルだけが返ってくるはず
    assert_equal "Ruby on Rails Tutorial Sample App", full_title
    
    # 引数ありの場合："Help | ベースタイトル" が返ってくるはず
    assert_equal "Help | Ruby on Rails Tutorial Sample App", full_title("Help")
  end
end