class Document < ActiveRecord::Base
    belongs_to :library
    belongs_to :user 
    validates :title, presence: true, length: { maximum: 120}
    validates :content, presence: true, length: { maximum: 1200 }    
    validates :user_id, presence: true
    validates :library_id, presence: true
end

