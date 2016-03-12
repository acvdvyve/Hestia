class Album < ActiveRecord::Base
  has_many :photos
  validates :name, :title, presence: true
  def path
    Rails.root.join("media", self.name)
  end

  def folderprep
    Dir.glob(@album.path.join('*.jpg')) do |jpg|
      jpg.slice! ".jpg"
      redirect_to :controller=>'photos', :action=>'new', :photo=>jpg
    end
  end
end
