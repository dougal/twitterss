xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Twitter / #{h @username} with friends")
    xml.link("http://twitter.com/#{h @username}/with_friends")
    xml.copyright("Copyright retained by original author, refer to http://twitter.com/statuses/friends_timeline.rss for further information")
    xml.description()
    xml.language('en-us')
      for tweet in @tweets
        xml.item do
          xml.title(tweet['text'])
          xml.description('<p>' + user_link(tweet['user']['screen_name']) + ': ' + auto_link(tweet['text']) + '</p><p>' + reply_link(tweet) + '</p>' )    
          xml.pubDate(tweet['created_at'])
          xml.guid(tweet_uri(tweet))
        end
      end
  }
}