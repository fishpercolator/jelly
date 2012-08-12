module ApplicationHelper
  
  def gravatar_for(user, size=48, options={})
    options[:class] ||= 'gravatar'
    options[:gravatar] = {:size => size, :default => :monsterid}
    gravatar_image_tag user.email, options
  end
  
end
