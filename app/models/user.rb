class User < ActiveRecord::Base
  before_create :set_auth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todos

  private

  def set_auth_token
    return if auth_token.present? # This line is (apparently) called a "guard clause". I get what it's doing but I'd like to have a better sense of this syntax which I've never encountered before ("return if"? What's that?)
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end
end
