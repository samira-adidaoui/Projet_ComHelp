class AdminMailer < ApplicationMailer

  default from: 'marinekouadio@gmail.com'
 
  def admin_email(admin)
    @admin = admin
    @url  = 'https://projet-comhelp-develop.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
  
end
