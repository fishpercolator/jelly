class Task < ActiveRecord::Base
  belongs_to :report
  validates_presence_of :text
end
