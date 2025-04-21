xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "sweet like bubblegum"
    xml.description "kat's blog"
    xml.link root_url

    @article.each do |article|
      xml.item do
        xml.title article.title
        xml.description markdown(article.body).html_safe
        xml.pubDate article.created_at.to_formatted_s(:rfc822)
        xml.link article_url(article)
        xml.guid article_url(article)
      end
    end
  end
end
