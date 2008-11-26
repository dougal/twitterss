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
          xml.title(h(tweet['user']['screen_name']) + ': ' + tweet['text'])
          xml.description('<p>' + user_link(tweet['user']['screen_name']) + ': ' + link_usernames(auto_link(tweet['text'])) + '</p><p>' + reply_link(tweet) + '</p>' )    
          xml.pubDate(DateTime.parse(tweet['created_at']).strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.guid(tweet_uri(tweet))
        end
      end
  }
}

