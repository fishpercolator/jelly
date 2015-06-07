class Achievement < ActiveRecord::Base
  belongs_to :report
  validates_presence_of :text
end
