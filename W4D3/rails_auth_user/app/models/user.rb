class User < ApplicationRecord
    attr_reader :password

    validates :username, :session_token, presence: true
    validates :password_digest, presence: {message: "Password can't be blank"}
    validates :password, length:{ minimum: 6, allow_nil: true }
    before_validation :ensure_session_token!

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return if user.nil?
        return unless BCrypt::Password.new(user.password_digest).is_password?(password)
        user
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_ression_token!
        self.session_token = self.class.generate_session_token
        self.save
    end

    def ensure_session_token!
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end
