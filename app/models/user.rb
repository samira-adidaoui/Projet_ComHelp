class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_votable
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
       has_many :created_posts, class_name: 'Post'
       has_many :participations
       has_many :answered_posts, through: :participations, source: :post
       validates :first_name, presence: true
       validates :last_name, presence: true
         
<<<<<<< HEAD
#       after_create :welcome_send
=======
       # after_create :welcome_send
>>>>>>> develop

       # def welcome_send
       #        UserMailer.welcome_email(self).deliver_now
       # end
end
