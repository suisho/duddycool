# -*- coding: utf-8 -*-

module CopipesHelper
  def format_article(text)
    # エスケープ
    text = text.dup
    text = html_escape(text)
    # 名前解析
    text = wrap_name(text)

    # div囲み
    text = text.gsub(/\r\n|\r|\n/, "<br>").html_safe
    return content_tag(:div, text, :class => "article_body")
  end

  # 名前部分を加工
  def wrap_name(text)
    name_part = extract_name(text)
    if(name_part)
      name_part_wrapped = content_tag(:span, name_part, :class => "name_2ch")
      return text.sub(name_part,name_part_wrapped )
    end
    return text
  end

  # 名前部分を特定する
  def extract_name(text)
    
    matches = /[1-9][0-9]{0,3}(\s)?(名前)?：(?<name>.+?)[\s　]?：?\s?[0-9\/]+\([月火水木金土日]\)\s[0-9:\.]+([\s[:alnum:]\/:]+)?/.match(text);
    if defined?(matches["name"]) then
      return matches["name"]
    else
      return nil
    end
  end
end
