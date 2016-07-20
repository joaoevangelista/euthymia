# frozen_string_literal: true
# :nodoc:
class Sentiment < ApplicationRecord
  belongs_to :entry
  belongs_to :user
end
