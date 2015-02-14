class Email < ActiveRecord::Base
	extend SimpleCalendar
  	has_calendar

  	validates :starts_at, presence: :true

end
