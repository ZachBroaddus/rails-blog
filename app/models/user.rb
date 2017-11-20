class User < ApplicationRecord
  has_secure_password

 EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :username, presence: true

  validates :password, length: { minimum: 8}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  # this callback will run before saving on create and update
  before_save :downcase_email

  # this callback will run after creating a new user
  after_create :successfully_created


  private
    def downcase_email
      self.email.downcase!
    end

    def successfully_created
      puts "Successfully created a new user"
    end

end
