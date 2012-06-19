# encoding: utf-8
require 'test_helper'

class CopipesHelperTest < ActionView::TestCase
  include ERB::Util

  # 通常テスト
  test 'format_article' do
    article = "aaaa
bbbb"
    assert_equal '<div class="article_body">aaaa<br>bbbb</div>', format_article(article)
  end

  # サニタイズテスト
  test 'format_article_sanitize' do
    warn_article = "aa<br>bb"
    assert_equal '<div class="article_body">aa&lt;br&gt;bb</div>', format_article(warn_article)
  end

  # 複数改行テスト
  test 'format_article_multi_br' do
    multi_br =
"1

2"
    assert_equal '<div class="article_body">1<br><br>2</div>', format_article(multi_br)
  end
  # 名前部分加工テスト
  test 'name_wrap' do
    input = "1 名前：名無しさん＠平常通り 2012/06/06(水) 02:13:59.47 ID:cUIVL1xb0"
    expect = '1 名前：<span class="name_2ch">名無しさん＠平常通り</span> 2012/06/06(水) 02:13:59.47 ID:cUIVL1xb0'
    assert_equal(expect, wrap_name(input))
  end
  
  # 名前部分抽出テスト
  test 'extract_name' do
    hash = {
      "1 名前：名無しさん＠平常通り 2012/06/06(水) 02:13:59.47 ID:cUIVL1xb0" => "名無しさん＠平常通り",
      "249 名前：名無し募集中。。。 ：2012/06/17(日) 12:50:03.90 0" => "名無し募集中。。。",
      "1：以下、名無しにかわりましてVIPがお送りします：2012/06/16(土) 16:53:34.13 ID:INR8j4Nc0" => "以下、名無しにかわりましてVIPがお送りします"
    }

    hash.each_pair{|input,expect|
      result = extract_name(input)
      assert_equal(expect,result)
    }
  end

end
