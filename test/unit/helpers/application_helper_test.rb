require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ERB::Util
  test 'format_article' do
    article = "aaaa
bbbb"
    assert_equal '<div class="article_body">aaaa<br>bbbb</div>', format_article(article)
  end

  test 'format_article_sanitize' do
    warn_article = "aa<br>bb"
    assert_equal '<div class="article_body">aa&lt;br&gt;bb</div>', format_article(warn_article)
  end

  test 'format_article_multi_br' do
    multi_br =
"1

2"
    assert_equal '<div class="article_body">1<br><br>2</div>', format_article(multi_br)
  end
end
