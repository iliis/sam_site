module ApplicationHelper
  class String
    def is_integer?
      self.to_i.to_s == self
    end
  end

  def markdown(text)
    # parse image tags [img:123] --> ![description](url)
    # or [thumb:123]
    text.gsub!(/\[(img|thumb|project|post)(:L|:R)?:(\d+)\]/) do |match|
      if $1 == "img" || $1 == "thumb"
        img = Image.find($3.to_i)
        c = "post_image"
        if $2 == ":L"
          c = "post_image_left"
        elsif $2 == ":R"
          c = "post_image_right"
        end
        link_to( \
          image_tag(img.file.url(if $1 == "img" then :normal else :thumb end), class: c, alt: img.description), \
          image_url(img))
      elsif $1 == "project"
        proj = Project.find($3.to_i)
        "[#{proj.title}](#{project_url(proj)})"
      elsif $1 == "post"
        post = Post.find($3.to_i)
        "[#{post.title}](#{project_post_url(post.project, post)})"
      else
        "ERROR"
      end
    end

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end
end
