class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    belongs_to :city
    has_many :users, through: :participation
    
    
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000}

end
