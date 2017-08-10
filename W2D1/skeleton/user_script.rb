require_relative 'super_useful'

# puts "'five' == #{convert_to_int('five')}"
#
# feed_me_a_fruit
begin
  sam = BestFriend.new('Rachel', 5, 'Sleeping')
rescue StandardError => e
  puts e.message
end

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
