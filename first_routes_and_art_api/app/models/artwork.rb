# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: {scope: :artist_id}
  validates :title, :artist_id, :image_url, presence: true

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment

  has_many :likes,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Like
end
