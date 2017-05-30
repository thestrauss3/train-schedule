require 'rubygems'
require 'httparty'
class UsersController < ApplicationController
  def show
    response = HTTParty.get('http://realtime.mbta.com/developer/api/v2/schedulebyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=CR-Worcester&max_trips=100&max_time=1440&datetime=1496116800')
    binding.pry
  end
end
