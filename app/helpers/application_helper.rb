module ApplicationHelper
  
  def gravatar_for(user, size=48, options={})
    options[:class] ||= 'gravatar'
    options[:gravatar] = {:size => size, :default => :monsterid}
    gravatar_image_tag user.email, options
  end

  def glyph(icon, description=nil)
    description ||= icon
    raw %{<span class="glyphicon glyphicon-#{icon}" aria-hidden="true" aria-label="#{description}"></span>}
  end

  # Use Redcarpet to add a markdown helper. Specify nl2br if you want
  # newlines converting to <br>
  def markdown(text, nl2br=false)
    return if !text
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(escape_html: true), autolink: true, space_after_headers: true, fenced_code_blocks: true)
    if nl2br
      @markdown.render(text).gsub(/\n/, '<br>').html_safe
    else
      @markdown.render(text).html_safe
    end
  end
  
end
