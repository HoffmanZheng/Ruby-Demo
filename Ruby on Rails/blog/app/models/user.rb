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
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    has_many :microposts, dependent: :destroy # 在删除用户的同时也会删除他的微博

    # return digest of specified string
    def User.digest(string) 
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # 如果方法不需要访问类的实例，就应该定义为类方法
    # return a random string with constant length
    def User.new_token
        SecureRandom.urlsafe_base64
    end


    # 之前的 password 虚拟属性是由 `has_secure_password` 自动创建的
    # 创建虚拟的 remember_token 属性，算出摘要后再存入数据库
    attr_accessor :remember_token
    # 把记忆令牌和用户关联起来，并把相应的记忆摘要存入数据库
    def remember
        # `self` 确保把值赋给用户的属性，而不是变成一个局部变量
        self.remember_token = User.new_token
        # 只更新单个属性可以使用 `update_attribute`，且这个方法会跳过验证 
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # 根据请求中的记忆令牌验证用户身份
    def authenticate?(remember_token)
        # 这里的 `remember_digest` 等同于 `self.remember_digest`
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # 清除持久会话中的记忆令牌摘要
    def forget
        update_attribute(:remember_digest, nil)
    end

    # 供首页已登录用户展示其发布的微博
    def feed
        # 问号确保 id 值在传入底层 SQL 查询前做了适当的转移，避免 SQL 注入
        Micropost.where("user_id = ?", id)
    end
end
