class Task < ActiveRecord::Base
  belongs_to :report
  attr_accessible :text
end
