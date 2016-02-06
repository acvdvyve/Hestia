class Album < ActiveRecord::Base
  has_many :photos
  validates :title, presence: true,
                  length: { minimum: 5 }

  def path
    Rails.root.join("media", self.title)
  end
end
