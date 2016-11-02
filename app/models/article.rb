class Article < ActiveRecord::Base
  belongs_to :owner
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "60x60>" }, default_url: "/images/:style/missing.png"
  validates_attachment :avatar, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  size: { in: 0..5.megabytes }
end
