class Ad < ApplicationRecord
  belongs_to :user
  enum location: {
    'Johor': 0,
    'Kedah': 1,
    'Kelantan': 2,
    'Kuala Lumpur': 3,
    'Melaka': 4,
    'N. Sembilan': 5,
    'Pahang': 6,
    'Penang': 7,
    "Perak": 8,
    'Perlis': 9,
    'Selangor': 10,
    'Sabah': 11,
    'Sarawak': 12,
    'Terengganu': 13
  }

  enum condition: {
    first_hand: 0,
    second_hand: 1
  }

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :location
  validates_presence_of :condition
  validates_presence_of :contact_name
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "need valid email" }

  mount_uploaders :pictures, PicturesUploader

  scope :location_filter, -> (location) { where location: location }
  scope :price_min, -> (price_min) { where "price > price_min" }
  scope :price_max, -> (price_max) { where "price > price_max" }
  scope :condition_filter, -> (condition) { where condition: condition }
  
end
