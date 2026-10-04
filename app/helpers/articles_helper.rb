module ArticlesHelper

def tag_links(tags)
	tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ")
end

def plain_wrap(text)
	word_wrap(text, :line_width => 72)
end

end
