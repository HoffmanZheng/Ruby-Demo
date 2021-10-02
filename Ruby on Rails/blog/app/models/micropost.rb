class Micropost < ApplicationRecord
    # ---> form association between user and microposts
    belongs_to :user
    # ---> implement the length constraint with validations
    validates :context, length: { maximum: 140 }, presence: true
end
