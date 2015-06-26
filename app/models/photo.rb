class Photo < ActiveRecord::Base
  scope :main_photos, -> { where(main: true) }

  belongs_to :item

  has_attached_file :image, :styles => {:medium => "300x300>"}, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true

  before_save :set_as_main_photo, if: :main?

  def set_as_main_photo
    main_photo=item.main_photo
    return if main_photo==self or not main_photo #first time created item with photos
    main_photo.update_attributes main: false

    # For development mode
    # item.photos.main_photos.each { |p| p.update_attributes main: false }
  end
end
