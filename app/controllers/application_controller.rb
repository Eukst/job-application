class ApplicationController < ActionController::Base
  def index
    render html: '<h1> Hello World </h1>'
  end
end
