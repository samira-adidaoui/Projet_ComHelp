class AdminMailer < ApplicationMailer
	  default from: 'alexsteph22@gmail.com'

	def new_ad_notification(post)

		@post=post
		mail(to: 'admin_comhelp@yopmail.com', subject: 'Une nouvelle annonce a été postée')
	end

end
