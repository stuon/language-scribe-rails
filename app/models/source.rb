class Source < ActiveRecord::Base
    validates :url, presence: true, length: { minimum: 10, maximum: 120 }
    validates :title, presence: false, length: { maximum: 120}
    validates :description, presence: false, length: { maximum: 600 }    
    validates :language_code, presence: false, length: { maximum: 10 }   
    validates :content_type, presence: false, length: { maximum: 10 } 
end

