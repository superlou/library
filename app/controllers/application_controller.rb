class ApplicationController < ActionController::Base
  protect_from_forgery

  def broadcast(channel, data)
    message = {channel: channel, data: data}
    if Rails.env.production?
        uri = URI.parse("http://library.louissimons.com:9292/faye")
    else
        uri = URI.parse("http://localhost:9292/faye")
    end
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
