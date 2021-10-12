class User < ApplicationRecord
    # self on the right hand is omitable
    # due to the unique constraint in db is case sensitive, 
    # so turn downcase before save to db
    before_save { self.email = self.email.downcase }  
    validates :name, presence: true, length: { maximum: 50 }
    # Constant uses UPPERCASE 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    # save password_hash in db; authenticate method; 
    # virtual attributes: password and password_confirmation
    # exist test when user create
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    # return digest of specified string
    def User.digest(string) 
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
