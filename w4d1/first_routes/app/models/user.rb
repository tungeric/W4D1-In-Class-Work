# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :viewed_artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :viewed_artworks,
    through: :viewed_artwork_shares,
    source: :artwork

  has_many :viewed_artists,
    through: :viewed_artworks,
    source: :artist

  has_many :viewers,
    through: :artworks,
    source: :shared_viewers

  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment
end
