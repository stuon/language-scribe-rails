class Library < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, length: { minimum: 3, maximum: 25}
    validates :description, presence: false, length: { maximum: 120 }    
    validates :user_id, presence: true
    validates_uniqueness_of :name, case_sensitive: false, scope: :user_id
end

