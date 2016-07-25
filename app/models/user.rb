# frozen_string_literal: true
# :nodoc:
class User < ApplicationRecord

  TEMP_EMAIL_PREFIX = 'user@euthymia'
  TEMP_EMAIL_REGEX = /\Auser@euthymia/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :confirmable

  has_many :journals
  has_many :entries
  has_many :sentiments
  has_many :emotions
  has_many :identities

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0, 20]
        )

        # check if confirmable is enabled
        user.skip_confirmation! if user.respond_to?(:skip_confirmation)
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
