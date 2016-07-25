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

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      # Create the user if it's a new registration
      create_user_if_new user, auth, email
    end
    save_identity_user user
    user
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  def save_identity_user(user)
    return unless identity.user != user
    identity.user = user
    identity.save!
  end
end

def create_user_if_new(user, auth, email)
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
