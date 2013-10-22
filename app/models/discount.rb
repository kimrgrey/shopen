class Discount < ActiveRecord::Base
  belongs_to :product

  scope :active, -> { where(active: true) }
end