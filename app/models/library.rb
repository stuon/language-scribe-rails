class Library < ActiveRecord::Base
    belongs_to :user
    has_many :websites, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3, maximum: 25}
    validates :description, presence: false, length: { maximum: 200 }    
    validates :user_id, presence: true
    validates_uniqueness_of :name, case_sensitive: false, scope: :user_id
end

