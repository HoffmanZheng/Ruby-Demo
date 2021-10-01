class User < ApplicationRecord
    # ---> form association between user and microposts
    has_many :microposts
end
