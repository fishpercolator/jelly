require 'jelly_dates'

class Report < ActiveRecord::Base
	
  belongs_to :user
  attr_accessible :excited, :help_needed, :jelly, :today, :previous_day
  
  has_many :achievements
  accepts_nested_attributes_for :achievements, :allow_destroy => true

  has_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true
  
  validates_presence_of :user, :excited, :jelly, :today, :previous_day
  
  # Set dates on object creation
  after_initialize do
  	if new_record?
  		self.today ||= Date.today
  		self.previous_day ||= JellyDates.previous_working_day(today)
  	end
  end
  
  # Ensure the nested attributes are included in hash representations
  def as_json(options={})
  	j = super(options)
  	j[:achievements] = self.achievements
  	j[:tasks] = self.tasks
  	j
  end

    		
end
