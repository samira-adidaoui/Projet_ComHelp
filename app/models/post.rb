class Post < ApplicationRecord
    #after_create :notif_new
    
    
    belongs_to :user
    belongs_to :category
    belongs_to :city
    has_many :participations
    has_many :users, through: :participations
    
    include AlgoliaSearch
    
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000}
=begin
    def notif_new
	AdminMailer.new_ad_notification(self).deliver_now
    end
=end

    algoliasearch per_environment: true do
        attribute :category, :city
    end
    
    
end


