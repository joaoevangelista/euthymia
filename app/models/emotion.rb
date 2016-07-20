# frozen_string_literal: true
class Emotion < ApplicationRecord
  belongs_to :entry
  belongs_to :user
end
