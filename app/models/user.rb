class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, plain_text_password)
    @user = User.find_by_email(email)
    if @user && @user.password == plain_text_password
      @user
    else
      nil
    end
  end

end