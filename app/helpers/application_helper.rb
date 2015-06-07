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
  
end
