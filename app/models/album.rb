class Album < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
