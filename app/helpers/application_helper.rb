module ApplicationHelper
  
  def gravatar_for(user, size=48)
    gravatar_image_tag user.email, :class => 'gravatar', :gravatar => {:size => size, :default => :monsterid}
  end
  
end
