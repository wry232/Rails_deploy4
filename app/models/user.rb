class User < ApplicationRecord
  has_secure_password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea, dependent: :destroy
  before_validation do
	  self.email = email.downcase if email.present?
  end
  validates :email, :password, :name, :alias, presence: true
  validates :email, :format => {:with => email_regex}
  validates :password,length: { minimum: 8 }
end
