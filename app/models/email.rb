class Email < ActiveRecord::Base
	extend SimpleCalendar
  	has_calendar
  	belongs_to :user

  	validates :starts_at, presence: :true

  	validate :email_cannot_be_scheduled_in_past


  	def email_cannot_be_scheduled_in_past
	    if starts_at.present? && starts_at < Date.today
	       errors.add(:starts_at, "- Your email cannot be scheduled in the past. :(")
	    end
  	end


end
