class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum:5, maximum:100}
    validates :description, presence: true, length: {minimum:5, maximum:500}
    validates :keywords, presence: true, length: {minimum:5, maximum:100}

    has_many_attached :images
    has_many :comments
    has_many :likes

    belongs_to :user

    before_create :randmoize_id


    private

    def randmoize_id
    begin
        self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
    end
end