# frozen_string_literal: true
# User controlling setting about thier account
class Setting < ApplicationRecord
  belongs_to :user
end
