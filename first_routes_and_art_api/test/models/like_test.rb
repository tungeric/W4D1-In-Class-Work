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

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
