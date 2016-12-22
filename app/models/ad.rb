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
  validates_presence_of :email

  mount_uploaders :pictures, PicturesUploader
end
