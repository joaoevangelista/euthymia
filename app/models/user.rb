# frozen_string_literal: true
# :nodoc:
class User < ApplicationRecord
  TEMP_EMAIL_PREFIX = 'user@euthymia'
  TEMP_EMAIL_REGEX = /\Auser@euthymia/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :journals, dependent: :delete_all
  has_many :entries, dependent: :delete_all
  has_many :sentiments, dependent: :delete_all
  has_many :emotions, dependent: :delete_all
  has_many :identities, dependent: :delete_all

  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

  after_create :create_settings

  def self.find_for_oauth(auth, identity = nil,signed_in_resource = nil)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
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
          # username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0, 20]
        )

        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  def create_settings
    Setting.new(user: self).save!
  end
end
