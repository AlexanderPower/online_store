class Photo < ActiveRecord::Base
  scope :main_photo,->{where(main:true)}

  belongs_to :item

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true

  before_save :set_as_main_photo, if: :main?

  def set_as_main_photo
    main_photo=item.photos.main_photo.first
    return if main_photo==self and item.photos.main_photo.length==1
    main_photo.update_attributes main:false if main_photo
  end
end
