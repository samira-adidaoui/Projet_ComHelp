require 'twitter'

class Post < ApplicationRecord
#    after_create :email_to_admin
#		after_commit :automatic_tweet

    belongs_to :user
    belongs_to :category
    belongs_to :city
    has_many :participations
    has_many :users, through: :participations
    
    
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000}
   
=begin
    def notif_new
	AdminMailer.new_ad_notification(self).deliver_now
    end
=end
    include AlgoliaSearch
    
    algoliasearch per_environment: true do
        attribute :category, :city, :title, :description
    end
    
    
end


