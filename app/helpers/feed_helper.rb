module FeedHelper
  
  def user_link(username, with_amp = false)
    text = h(username)
    text = "@#{text}" if with_amp
    link_to text, "http://twitter.com/#{h(username)}"
  end
  
  def tweet_uri(tweet)
    "http://twitter.com/#{h tweet['user']['screen_name']}/statuses/#{tweet['id']}"
  end
  
  def reply_link(tweet)
    link_to "reply", "http://twitter.com/home?status=@#{h tweet['user']['screen_name']}%20&in_reply_to_status_id=#{tweet['id']}"
  end
  
  def link_usernames(content)
    content.gsub(/@([\w]+)/) do |m|
      # Could not figure out how to get the first grouping from the regex here.
      user_link(m[1..100], true)
    end
  end
  
end
