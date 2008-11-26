module FeedHelper
  
  def user_link(username)
    link_to h(username), "http://twitter.com/#{h(username)}"
  end
  
  def tweet_uri(tweet)
    "http://twitter.com/#{h tweet['user']['screen_name']}/statuses/#{tweet['id']}"
  end
  
  def reply_link(tweet)
    link_to "reply", "http://twitter.com/home?status=@#{h tweet['user']['screen_name']}%20&in_reply_to_status_id=#{tweet['id']}"
  end
  
end
