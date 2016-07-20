# frozen_string_literal: true
# :nodoc:
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :journals
  has_many :entries
  has_many :sentiments
  has_many :emotions
end
