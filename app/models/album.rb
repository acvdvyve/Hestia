class Album < ActiveRecord::Base
  has_many :photos
  validates :title, presence: true,
                  length: { minimum: 5 }
end
