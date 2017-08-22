# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  comment_id :integer
#  artwork_id :integer
#  liker_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  validates :liker_id, presence: true
  # validates :artwork_id, uniqueness: { scope: :liker_id }
  # validates :comment_id, uniqueness: { scope: :liker_id }
  # validate :artwork_or_comment_presence

  # def artwork_or_comment_presence
  #   if (comment_id && artwork_id) || !(comment_id || artwork_id)
  #     errors[:comment_id] << 'Like must be for either comment or artwork'
  #     errors[:artwork_id] << 'Like must be for either comment or artwork'
  #   end
  # end

  belongs_to :comment,
    primary_key: :id,
    foreign_key: :comment_id,
    class_name: :Comment,
    optional: true

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork,
    optional: true

  belongs_to :liker,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :User

end
