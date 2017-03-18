class User < ActiveRecord::Base

  validates :user_name, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: true
  has_many :comments, as: :commentable
  has_many :questions
  has_many :answers
  has_many :votes, as: :votable


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
  	valid_user = User.find_by(email: email)
  	valid_user.password == password ? valid_user : nil
  end

end
