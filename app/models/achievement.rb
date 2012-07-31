class Achievement < ActiveRecord::Base
  belongs_to :report
  attr_accessible :text
  validates_presence_of :text
end
