class Email < ActiveRecord::Base
	extend SimpleCalendar
  	has_calendar
  	belongs_to :user

  	validates :starts_at, presence: :true

end
