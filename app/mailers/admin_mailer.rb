class AdminMailer < ApplicationMailer
<<<<<<< HEAD
=begin
	  default from: 'alexsteph22@gmail.com'
=======
	  default from: 'alexsteph22@gmail.com
	  '
>>>>>>> develop

	def new_ad_notification(post)

		@post=post
		mail(to: 'admin_comhelp@yopmail.com', subject: 'Une nouvelle annonce a été postée')
	end
=end
end
