require 'jelly_dates'

class Report < ActiveRecord::Base
	
  belongs_to :user
  attr_accessible :excited, :help_needed, :jelly, :today, :previous_day
  attr_accessible :achievements_attributes, :tasks_attributes
  
  has_many :achievements
  accepts_nested_attributes_for :achievements, :allow_destroy => true

  has_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true
  
  validates_presence_of :user, :excited, :jelly, :today, :previous_day
  
  # Get a count of reports for each day, ordered by days in reverse
  def self.day_counts
    self.select('today, count(*) as c').group(:today).order('today desc')
  end
  
  # Set dates on object creation
  after_initialize do
  	if new_record?
  		self.today ||= Date.today
  		self.previous_day ||= JellyDates.previous_working_day(today)
  		# ensure we have exactly 3 achievements and 3 tasks
  		while self.achievements.length < 3
  			self.achievements << Achievement.new
  		end
  		while self.tasks.length < 3
  			self.tasks << Task.new
  		end
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
