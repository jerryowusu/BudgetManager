# frozen_string_literal: true

class Slot < ApplicationRecord
  belongs_to :category
  belongs_to :exchange
end
