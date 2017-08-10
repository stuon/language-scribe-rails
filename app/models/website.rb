class Website < ActiveRecord::Base
    belongs_to :library
    belongs_to :user 
    belongs_to :source
    validates :url, presence: true, length: { minimum: 10, maximum: 120 }
    validates :title, presence: false, length: { maximum: 120}
    validates :note, presence: false, length: { maximum: 600 }    
    validates :user_id, presence: true
    validates :library_id, presence: true
    validates :source_id, presence: false
end

