class Photo < ActiveRecord::Base
  belongs_to :album

  dragonfly_accessor :image
  has_attached_file :file,
  styles: {
  large: "1000x1000>",
  medium: "500x500>",
  thumb: "150x150>",
  square: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
if !self.name.nil?
  def path
    self.album.path.join(self.name)
  end
end

  validates :name, presence: true
end
