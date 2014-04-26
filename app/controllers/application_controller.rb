class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
