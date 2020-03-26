class User < ActiveRecord::Base

	has_many :articles

	before_save { self.email = email.downcase }

	validates :username, presence: true, uniqueness: { case_sensitive: false}, length: {minimum: 3, maximum: 25}
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end	