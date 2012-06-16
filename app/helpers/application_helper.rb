module ApplicationHelper
  def format_article(text)
    text = text.dup
    text = html_escape(text)
    text = text.gsub(/\r\n|\r|\n/, "<br>").html_safe
    content_tag(:div, text, :class => "article_body")
  end
end
