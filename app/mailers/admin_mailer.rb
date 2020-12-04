class AdminMailer < ApplicationMailer
	  default from: 'no-reply@monsite.fr'

	def new_ad_notification(post)

		@post=post
		mail(to: 'admin_comhelp@yopmail.com', subject: 'Une nouvelle annonce a été postée')
	end

end
