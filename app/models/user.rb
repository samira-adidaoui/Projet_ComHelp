class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city
       has_many :created_posts, class_name: 'Post'
       has_many :participations
<<<<<<< HEAD
			 has_many :answered_posts, through: :participations, source: :post
=======
       has_many :answered_posts, through: :participations, source: :post
>>>>>>> develop
       validates :first_name, presence: true
       validates :last_name, presence: true
         

end
