# frozen_string_literal:true

# application class default class
class ApplicationController < ActionController::Base
  def index
    render html: 'Hello World'
  end
end
