class Report < ActiveRecord::Base
  belongs_to :user
  attr_accessible :help_needed, :jelly
end
