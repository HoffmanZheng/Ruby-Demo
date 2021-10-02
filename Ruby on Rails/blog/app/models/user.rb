class User < ApplicationRecord
    # ---> form association between user and microposts
    has_many :microposts
    validates :name, presence: true
    validates :email, presence: true
end
