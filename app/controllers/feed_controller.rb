class FeedController < ApplicationController
    
  def friends_timeline
    authenticate_or_request_with_http_basic do |username, password|
      @tweets = JSON.parse(`curl -u #{username}:#{password} http://twitter.com/statuses/friends_timeline.json`)
      @username = username
      !@tweets.include?('error')
    end

    respond_to do |format|
      format.rss {}
    end
  end
  
end
