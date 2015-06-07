require 'jelly_dates'

class Report < ActiveRecord::Base
	
  belongs_to :user
  
  has_many :achievements, -> { order 'achievements.id' }
  accepts_nested_attributes_for :achievements, limit: 3, allow_destroy: true

  has_many :tasks, -> { order 'tasks.id' }
  accepts_nested_attributes_for :tasks, limit: 3, allow_destroy: true
  
  validates_presence_of :user, :excited, :jelly, :today, :previous_day
  validates_uniqueness_of :today, :scope => [:user_id]
  
  # Support roles
  resourcify
  
  # Get a count of reports for each day, ordered by days in reverse
  def self.day_counts
    self.select('today, count(*) as c').group(:today).order('today desc')
  end
  
  # Set dates on object creation
  after_initialize do
  	if new_record?
  		self.today ||= Date.today
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
  
  # Find the next and previous reports in the current meeting
  def next_prev
    reports = Report.where(:today => today).order(:created_at).to_a
    index = reports.index(self)
    {
      :next => (index < reports.length ? reports[index+1] : nil),
      :prev => (index > 0 ? reports[index-1] : nil)
    }
  end

  # The report for the previous working day for this user, if there is
  # one (nil otherwise)
  def previous_day_report
    Report.where(:today => JellyDates.previous_working_day(today),
                 :user_id => user).first
  end
    		
end
