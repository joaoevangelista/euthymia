# frozen_string_literal: true
# Provides an Identity of third party auth
class Identity < ApplicationRecord
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_for_oauth(auth)
    identity = find_or_create_by(uid: auth.uid, provider: auth.provider)
    if auth.credentials && auth.credentials.token
      identity.access_token = auth.credentials.token
      identity.save
    end
    identity
  end
end
